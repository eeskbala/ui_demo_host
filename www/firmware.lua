
print("LUA: Firmware Upgrade Script loading\n");

update = {
	ctx = nil,
	log = "Firmware Upgrade Log",
};

firmware = {
	ctx = nil,
	files = {},
	current_file_idx = 0,
}

page_show_timer = ffi.cast("c_runloop_task_id_t", 0);

function start_firmware_scan(ignore)
	print("LUA: timer called, amazing\n");
	cmsg_send_message("txui.page.push", "firmware");

	C.system("cd ../");
	C.system("/etc/scan_usb.sh");
	return 0;
end

C.cmsg_bind_register(ctx, "device.disk.add",
	function(bind, refcon, msg, payload)
		print("LUA: Disk Added", ffi.string(payload));

		C.c_runloop_cancel_id(
				C.txui_get_runloop(), page_show_timer);
		page_show_timer = C.c_runloop_schedule_timer(
				C.txui_get_runloop(),
				start_firmware_scan, nil, nil, 100 * 10);
	end, NULL );

C.cmsg_bind_register(ctx, "device.disk.remove",
	function(bind, refcon, msg, payload)
		print("LUA: Disk Removed");
		ui_button_enable("firmware.scan", true);
		ui_button_enable("firmware.upgrade", false);
	end, NULL );

function firmware_name_update()
	print("LUA FIRMWARE firmware_name_update");
	local te = true;
	local be = true;
	if firmware.current_file_idx <= 1 then
		print("LUA FIRMWARE firmware_name_update #1 / idx = ", firmware.current_file_idx);
		firmware.current_file_idx = 1;
		te = false;
	end
	if firmware.current_file_idx >= #firmware.files then
		print("LUA FIRMWARE firmware_name_update #2 / idx = ", firmware.current_file_idx);
		print("LUA FIRMWARE firmware_name_update #2 / fw files = ", #firmware.files);
		firmware.current_file_idx = #firmware.files
		be = false;
	end
	ui_button_enable("up_arrow", te);
	ui_button_enable("down_arrow", be);
	local label = "press 'scan'";
	if #firmware.files > 0 and firmware.current_file_idx <= #firmware.files then
		print("LUA FIRMWARE firmware_name_update #3 / idx = ", firmware.current_file_idx);
		print("LUA FIRMWARE firmware_name_update #2 / fw files = ", #firmware.files);
		label = firmware.files[firmware.current_file_idx];
		ui_button_enable("firmware.upgrade", true);
	else
		ui_button_enable("firmware.upgrade", false);
	end
	ui_set_label("firmware_filename", label);
end

C.cmsg_bind_register(ctx, "firmware.files",
	function(bind, refcon, msg, payload)
		ui_button_enable("firmware.scan", true);
		print("LUA: Received firmware files: ", ffi.string(payload));
		local a = C.cnode_from_json(payload, 0);
		local ac = tonumber(C.cnode_count_subnodes(a));
		print("LUA count subnodes", ac);
		if ac == 0 then
			ui_button_enable("up_arrow", te);
			ui_button_enable("down_arrow", be);
			ui_set_label("firmware_filename", "No Updates files\nfound");
		else
			firmware.current_file_idx = 1;
			firmware.files = {};
			for idx = 0, ac-1 do
				local st = C.cnode_get_string(C.cnode_get_subnode(a, idx), "");
				print("LUA filename", idx, ffi.string(st));
				firmware.files[idx+1] = ffi.string(st);
			end
			print("Converted list", firmware.files);
			firmware_name_update();
		end
	end, NULL );


C.cmsg_bind_register(ctx, "ui.page.show.firmware",
	function(bind, refcon, msg, payload)
		print("LUA: FIRMWARE show");

		firmware_name_update();

		firmware.ctx = cmsg_create_context("lua,firmware");

		C.cmsg_bind_register(firmware.ctx, "firmware.scan",
			function(bind, refcon, msg, payload)
				print("LUA FIRMWARE scan");
				ui_button_enable("firmware.scan", false);
				C.system("cd ../");
				C.system("/etc/scan_usb.sh");
			end, NULL );

		C.cmsg_bind_register(firmware.ctx, "firmware.upgrade",
			function(bind, refcon, msg, payload)
				print("LUA FIRMWARE upgrade");
				if C.async_system(
						string.format("cd ../; /etc/update.sh \"%s\"",
								firmware.files[firmware.current_file_idx]),
						function(kind, line)
                                                if( kind == 1 ) then
                                                        if(ffi.string(line)) then
                                                                        ui_set_label("update_running_log", ffi.string(line));
                                                        end
                                                end
                                                print("update line", tonumber(kind), ffi.string(line));
						end
						) == 0 then
                                        ui_set_label("update_running_log", "Update Complete");
					cmsg_send_message("txui.page.push", "firmware_update");
                                        
				end
			end, NULL );

		C.cmsg_bind_register(firmware.ctx, "ui.up",
			function(bind, refcon, msg, payload)
				print("LUA: FIRMWARE up");
				firmware.current_file_idx = firmware.current_file_idx-1;
				firmware_name_update();
			end, NULL );

		C.cmsg_bind_register(firmware.ctx, "ui.down",
			function(bind, refcon, msg, payload)
				print("LUA: FIRMWARE down");
				firmware.current_file_idx = firmware.current_file_idx+1;
				firmware_name_update();
			end, NULL );

	end, NULL );

C.cmsg_bind_register(ctx, "ui.page.load.firmware",
	function(bind, refcon, msg, payload)
		print("LUA: FIRMWARE page loaded, w00t");
		local f = io.open("/etc/minifs.tag", "r");
		local tag = nil;
		if f ~= nil then
			tag = f:read("*all");
			f:close();
		end
		if tag == nil then	
			tag = "(dev)";
		end
		ui_set_label("firmware_version", tag);
	end, NULL );




C.cmsg_bind_register(ctx, "ui.page.show.firmware_update",
	function(bind, refcon, msg, payload)
		print("LUA: update page showing");

		update.ctx = cmsg_create_context("lua,firmware_update");

	end, NULL );


C.cmsg_bind_register(ctx, "ui.page.hide.firmware_update",
	function(bind, refcon, msg, payload)
		C.cmsg_context_free(update.ctx);
		update.ctx = nil;
	end, NULL );
