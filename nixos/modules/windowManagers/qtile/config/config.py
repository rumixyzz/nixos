import os

import libqtile.resources
import os
import subprocess
from libqtile import bar, layout, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("/etc/nixos/modules/windowManagers/qtile/config/autostart.sh")
    subprocess.call(home)


mod = "mod4"
terminal = "alacritty"
launcher = "rofi -show drun"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.spawn(launcher), desc="Spawn a command using a launcher"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 1"), desc="incr volume 1"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 1"), desc="decr volume 1")
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(name="1", label=""),
          Group(name="2", label=""),
          Group(name="3", label=""),
          Group(name="4", label="󰣖"),
          Group(name="5", label="󰉋"),
          Group(name="6", label=""),
          Group(name="7", label=""),
          Group(name="8", label="󰀄"),
          Group(name="9", label=""),
          ]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        border_focus="#d65d0e",
        border_normal="#282828",
        border_on_single=True,
        margin=18,
        border_width=2
        ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="monospace",
    fontsize=16,
    foreground="#282828",
    padding=6,
)
extension_defaults = widget_defaults.copy()

def rect_left(color):
    return {
        "decorations": [
            RectDecoration(
                colour=color,
                radius=[6, 0, 0, 6],  # 👈 only left corners rounded
                filled=True,
                padding_y=4,
                group=True,
            )
        ],
        "padding": 8,
    }

def rect_right(color):
    return {
        "decorations": [
            RectDecoration(
                colour=color,
                radius=[0, 6, 6, 0],  # 👈 only right corners rounded
                filled=True,
                padding_y=4,
                group=True,
            )
        ],
        "padding": 8,
    }

def rect(color):
    return {
        "decorations": [
            RectDecoration(
                colour=color,
                radius=6,
                filled=True,
                padding_y=4,
                group=True,
            )
        ],
        "padding": 10,
    }

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                        highlight_method="line",
                        active="#665c54",
                        foreground="#3c386",
                        this_current_screen_border="#d65d0e",
                        highlight_color=["#282828","#282828"],
                    ),
                widget.WindowName(width=bar.CALCULATED, **rect("#504945"), foreground="#ebdbb2", empty_group_string="", name="winname"),
                widget.Spacer(lenth=bar.STRETCH),

                widget.Systray(),
                widget.Spacer(length=6),
                widget.TextBox(
                    text="󰁿",
                    **rect_left("#cc241d"),
                    ),

                widget.Battery(
                    fmt="{}",
                    format="{percent:2.0%}",
                    **rect_right("#3c3836"),
                    foreground="#d5c4a1",
                    ),

                widget.Spacer(length=6),
                widget.TextBox(
                    text="󰕾",
                    **rect_left("#458588"),
                    ),
                widget.PulseVolume(fmt="{}", **rect_right("#3c3836"), foreground="#d5c4a1"),

                widget.Spacer(length=6),
                widget.Clock(
                    format="%a",
                    font="monospace Bold",
                    **rect_left("#689d6a"),
                    ),
                widget.Clock(format="%I:%M %p", font="monospace Bold", **rect_right("#3c3836"), foreground="#ebdbb2"),

                widget.Spacer(length=4)
            ],
            38,
            background="#282828"
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        background="#000000",
        wallpaper="~/Downloads/castle.jpg",
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

@hook.subscribe.client_focus
@hook.subscribe.client_killed
def toggle_windowname(*args):
    for w in qtile.widgets_map.values():
        if w.name == "winname":
            if qtile.current_window is None:
                w.hide()
            else:
                w.show()

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
focus_previous_on_window_remove = False
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

idle_inhibitors = []  # type: list

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
