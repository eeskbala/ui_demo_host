-- Reading http://luajit.org/ext_ffi_semantics.html is ESSENTIAL
-- to understand how the lua <-> C integration works.

require "lua_headers"

ffi.cdef[[
extern struct ui_t * ui;
c_runloop_p
txui_get_runloop();
]]

local C = ffi.C;

print("LUA: Starting up\n");

led = {
	ctx = nil,
	ledstate = false,
};

local ctx = C.cmsg_bus_getcontext(NULL, "lua");
if (ctx ~= NULL) then
	print("lua context existed, flushing it");
	C.cmsg_context_free(ctx);
end

function cmsg_create_context(context_name)
	local ctx = C.cmsg_bus_getcontext(NULL, context_name);
	if (ctx ~= NULL) then
		print("lua context ", context_name, " existed, flushing it");
		C.cmsg_context_free(ctx);
	end
	ctx = C.cmsg_context_new(NULL, context_name);
end

function cmsg_send_message(msg, payload)
	local h = C.cmsg_context_getmessage(ctx, msg);
	if h == nil then
		h = C.cmsg_message_register(ctx, msg);
		print("LUA: register message %s\n", msg);
	end
	C.cmsg_message_send(h, payload);
end

ctx = cmsg_create_context("lua");

function ui_button_enable(name, enabled)
	local page = C.ui_get_current_page(nil);
	local button = C.ui_object_find(page, name);
	if button == nil then
		print("LUA: button not found", name);
	end
	if enabled then
		C.ui_object_remove_class(button, "disabled");
	else
		C.ui_object_add_class(button, "disabled");
	end
end

function ui_checkbox_enable(name, enabled)
	local page = C.ui_get_current_page(nil);
	local button = C.ui_object_find(page, name);
	if button == nil then
		print("LUA: checkbox not found", name);
	end
        print("LUA Check box", name, button, enabled);

	if enabled then
		C.ui_object_remove_class(button, "checked");
                C.system("echo 0 > /sys/class/gpio/gpio7/value");                
	else
		C.ui_object_add_class(button, "checked");
                C.system("echo 1 > /sys/class/gpio/gpio7/value");                
	end
end


function ui_set_label(name, value)
	local json = string.format("{\"%s\":\"%s\"}", name, value);
	local values = C.cnode_from_json(json, 0);
	C.ui_set_form_values(nil, values);
end

C.cmsg_bind_register(ctx, "ui.page.show",
	function(bind, refcon, msg, payload)
                payload = ffi.string(payload);
		print("LUA show page", msg, payload);

		local page = C.ui_get_current_page(nil);
		local button = C.ui_object_find(page, "validate");
		C.ui_object_add_class(button, "disabled");

		print("LUA page", page);
                
                if payload == "m_music_source" then
                        print("Stopping media playback");
                        C.system("ps aux | grep -i mplayer | grep -v grep| awk {'print $2'}| xargs kill -9");
                end
                if payload == "m_system_source" then
                        C.system("echo 0 > /sys/class/gpio/gpio7/value");
                end
	end, NULL );

C.cmsg_bind_register(ctx, "ui.page.hide",
	function(bind, refcon, msg, payload)
		payload = ffi.string(payload);
		print("LUA hide page", msg, payload);
	end, NULL );

C.cmsg_bind_register(ctx, "ui.page.dirty",
	function(bind, refcon, msg, payload)

	--	ui_button_enable("validate", true);

	end, NULL );

C.cmsg_bind_register(ctx, "ui.page.save",
	function(bind, refcon, msg, payload)

		local values = C.ui_get_form_values(NULL);
		local val = C.cnode_get_subnode(values, 0);
                print("LUA save value ", page, value, val);

		while val ~= nil do
			local key = ffi.string(C.cnode_get_key(val));
			local valv = C.cnode_to_string(val, ""); -- needs freeing
			local valt = ffi.string(valv);

			print("LUA save value ", key, valt);
			C.talloc_unlink(nil, ffi.cast("void*",valv));

                        
                        if key == "a_source" then
                                C.system("ps aux | grep -i mplayer | grep -v grep| awk {'print $2'}| xargs kill -9");
                                if valt == "Jazz Piano" then
                                        C.system("mplayer --quiet bensound-thejazzpiano.mp3 &");
                                elseif  valt == "November" then
                                        C.system("mplayer --quiet bensound-november.mp3 &");
                                elseif  valt == "The Duel" then
                                        C.system("mplayer --quiet bensound-theduel.mp3 &");
                                elseif  valt == "Bossa Nova" then
                                        C.system("mplayer --quiet bensound-theelevatorbossanova.mp3 &");
                                end        
                                cmsg_send_message("txui.page.push", "m_music_play");
                                C.ui_set_form_values(nil, values);
                                ui_button_enable("validate", false);
                        end
			-- C.system(string.format("/bin/hush /tmp/rw/value_change.sh %s %s", key, valt));

			val = C.cnode_next(val);
		end
                if led.ledstate == true then
                        ui_checkbox_enable("led_on", true);
                        led.ledstate = false;
                else
                        ui_checkbox_enable("led_on", false);
                        led.ledstate = true;
                end
                        
                
	end, NULL );

C.cmsg_bind_register(ctx, "ui.page.validate",
	function(bind, refcon, msg, payload)
		ui_button_enable("validate", true);
	end, NULL );

C.cmsg_bind_register(ctx, "system.reboot",
	function(bind, refcon, msg, payload)
		C.system("reboot");
	end, NULL );

print("LUA: All Loaded\n");
