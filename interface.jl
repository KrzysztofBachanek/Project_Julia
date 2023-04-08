module interface
    using Gtk

    function center_button(button)
        allocation = get_allocation(button)
        win = get_toplevel(button)
        win_allocation = get_allocation(win)
        x = (win_allocation.width - allocation.width) ÷ 2
        y = (win_allocation.height - allocation.height) ÷ 2
        set_position(button, x, y)
    end

    function create_window()
        redirect_stdout(devnull) # redirect standard output to /dev/null
        win = Gtk.Window("MyGame")
        fullscreen(win)

        close_button = Gtk.Button("Close")
        signal_connect(close_button, "clicked") do widget
            destroy(win)
        end
        push!(win, close_button)

        showall(win)
        redirect_stdout(stdout) # restore standard output
    end
end
#сделай кнопку красной и с рамкой в верхнем правом углу.