cat >"${HOME}/.config/openbox/rc.xml.2" <<'EOF'
<?xml version="1.0"?>
<!-- Copyright (C) 2020-2021 Aditya Shakya <adi1090x@gmail.com> -->
<!-- Everyone is permitted to copy and distribute copies of this file under GNU-GPL3 -->
<!-- ################################ General Settings ################################ -->
<openbox_config xmlns="http://openbox.org/3.4/rc" xmlns:xi="http://www.w3.org/2001/XInclude">
  <resistance>
    <strength>2</strength>
    <screen_edge_strength>2</screen_edge_strength>
  </resistance>
  <focus>
    <focusNew>yes</focusNew>
    <followMouse>no</followMouse>
    <focusLast>yes</focusLast>
    <underMouse>no</underMouse>
    <focusDelay>200</focusDelay>
    <raiseOnFocus>no</raiseOnFocus>
  </focus>
  <placement>
    <policy>Smart</policy>
    <center>yes</center>
    <monitor>Mouse</monitor>
    <primaryMonitor>Mouse</primaryMonitor>
  </placement>
  <theme>
    <name>Adapta-Nokto</name>
    <titleLayout>LIMC</titleLayout>
    <keepBorder>no</keepBorder>
    <animateIconify>yes</animateIconify>
    <font place="ActiveWindow">
      <name>SauceCodePro Nerd Font Mono</name>
      <size>10</size>
      <weight>Bold</weight>
      <slant>Normal</slant>
    </font>
    <font place="InactiveWindow">
      <name>SauceCodePro Nerd Font Mono</name>
      <size>10</size>
      <weight>Normal</weight>
      <slant>Normal</slant>
    </font>
    <font place="MenuHeader">
      <name>SauceCodePro Nerd Font Mono</name>
      <size>10</size>
      <weight>Bold</weight>
      <slant>Normal</slant>
    </font>
    <font place="MenuItem">
      <name>SauceCodePro Nerd Font Mono</name>
      <size>10</size>
      <weight>Normal</weight>
      <slant>Normal</slant>
    </font>
    <font place="ActiveOnScreenDisplay">
      <name>SauceCodePro Nerd Font Mono</name>
      <size>10</size>
      <weight>Bold</weight>
      <slant>Normal</slant>
    </font>
    <font place="InactiveOnScreenDisplay">
      <name>SauceCodePro Nerd Font Mono</name>
      <size>10</size>
      <weight>Normal</weight>
      <slant>Normal</slant>
    </font>
  </theme>
  <desktops>
    <number>5</number>
    <firstdesk>0</firstdesk>
    <names>
      <name>1</name>
      <name>2</name>
      <name>3</name>
      <name>4</name>
      <name>5</name>
    </names>
    <popupTime>0</popupTime>
  </desktops>
  <resize>
    <drawContents>yes</drawContents>
    <popupShow>Always</popupShow>
    <popupPosition>Center</popupPosition>
    <popupFixedPosition>
      <x>10</x>
      <y>10</y>
    </popupFixedPosition>
  </resize>
  <margins>
    <top>0</top>
    <bottom>5</bottom>
    <left>5</left>
    <right>5</right>
  </margins>
  <dock>
    <position>Bottom</position>
    <floatingX>0</floatingX>
    <floatingY>0</floatingY>
    <noStrut>no</noStrut>
    <stacking>Above</stacking>
    <direction>Vertical</direction>
    <autoHide>no</autoHide>
    <hideDelay>300</hideDelay>
    <showDelay>300</showDelay>
    <moveButton>Middle</moveButton>
  </dock>
  <!-- ################################ Keybindings ################################ -->
  <keyboard>
    <chainQuitKey/>
    <!-- Change Workspace/Desktop -->
    <keybind key="W-1">
      <action name="GoToDesktop">
        <to>1</to>
      </action>
    </keybind>
    <keybind key="W-2">
      <action name="GoToDesktop">
        <to>2</to>
      </action>
    </keybind>
    <keybind key="W-3">
      <action name="GoToDesktop">
        <to>3</to>
      </action>
    </keybind>
    <keybind key="W-4">
      <action name="GoToDesktop">
        <to>4</to>
      </action>
    </keybind>
    <keybind key="W-5">
      <action name="GoToDesktop">
        <to>5</to>
      </action>
    </keybind>
    <!-- Move application to specific desktop -->
    <keybind key="S-W-1">
      <action name="SendToDesktop">
        <desktop>1</desktop>
      </action>
    </keybind>
    <keybind key="S-W-2">
      <action name="SendToDesktop">
        <desktop>2</desktop>
      </action>
    </keybind>
    <keybind key="S-W-3">
      <action name="SendToDesktop">
        <desktop>3</desktop>
      </action>
    </keybind>
    <keybind key="S-W-4">
      <action name="SendToDesktop">
        <desktop>4</desktop>
      </action>
    </keybind>
    <keybind key="S-W-5">
      <action name="SendToDesktop">
        <desktop>5</desktop>
      </action>
    </keybind>
    <!-- Switch b/w Applications -->
    <keybind key="A-Tab">
      <action name="NextWindow">
        <allDesktops>no</allDesktops>
        <raise>yes</raise>
        <!-- Hide black border around windows -->
        <bar>no</bar>
        <finalactions>
          <action name="Focus"/>
          <action name="UnshadeRaise"/>
        </finalactions>
      </action>
    </keybind>
    <keybind key="W-Tab">
      <action name="NextWindow">
        <allDesktops>yes</allDesktops>
        <!-- Hide black border around windows -->
        <bar>no</bar>
        <finalactions>
          <action name="focus"/>
          <action name="raise"/>
        </finalactions>
      </action>
    </keybind>
    <!-- Window Tiling: Snap feature -->
    <keybind key="W-Left">        # HalfLeftScreen
      <action name="Unmaximize"/>
      <action name="MoveResizeTo"><x>0</x><y>0</y><height>100%</height><width>50%</width></action>
    </keybind>
    <keybind key="W-Right">        # HalfRightScreen
      <action name="Unmaximize"/>
      <action name="MoveResizeTo"><x>-0</x><y>0</y><height>100%</height><width>50%</width></action>
    </keybind>
    <keybind key="W-Up">        # HalfUpperScreen
      <action name="Unmaximize"/>
      <action name="MoveResizeTo"><x>-0</x><y>0</y><width>50%</width><height>50%</height></action>
    </keybind>
    <keybind key="W-Down">        # HalfLowerScreen
      <action name="Unmaximize"/>
      <action name="MoveResizeTo"><x>-0</x><y>-0</y><width>50%</width><height>50%</height></action>
    </keybind>
    <keybind key="A-z">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>15</x>
        <y>15</y>
        <height>97%</height>
        <width>32%</width>
      </action>
    </keybind>
    <keybind key="A-x">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>34%</x>
        <y>15</y>
        <height>97%</height>
        <width>32%</width>
      </action>
    </keybind>
    <keybind key="A-c">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>-17</x>
        <y>15</y>
        <height>97%</height>
        <width>32%</width>
      </action>
    </keybind>
    <!-- Windows Tiling -->
    <keybind key="W-KP_1">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>-0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="W-KP_2">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>-0</y>
        <width>100%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="W-KP_3">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>-0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="W-KP_4">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>0</y>
        <width>50%</width>
        <height>100%</height>
      </action>
    </keybind>
    <keybind key="W-KP_5">
      <action name="MaximizeFull"/>
    </keybind>
    <keybind key="W-KP_6">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>0</y>
        <width>50%</width>
        <height>100%</height>
      </action>
    </keybind>
    <keybind key="W-KP_7">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="W-KP_8">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>0</y>
        <width>100%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="W-KP_9">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    <!-- Move -->
    <keybind key="W-A-Up">
      <action name="MoveRelative">
        <x>0</x>
        <y>-20</y>
      </action>
    </keybind>
    <keybind key="W-A-Down">
      <action name="MoveRelative">
        <x>0</x>
        <y>20</y>
      </action>
    </keybind>
    <keybind key="W-A-Left">
      <action name="MoveRelative">
        <x>-20</x>
        <y>0</y>
      </action>
    </keybind>
    <keybind key="W-A-Right">
      <action name="MoveRelative">
        <x>20</x>
        <y>0</y>
      </action>
    </keybind>
    <!-- Change Desktops -->
    <keybind key="C-A-Right">
      <action name="DesktopRight">
        <wrap>no</wrap>
      </action>
    </keybind>
    <keybind key="C-A-Left">
      <action name="DesktopLeft">
        <wrap>no</wrap>
      </action>
    </keybind>
    <!-- Resize -->
    <keybind key="C-A-Down">
      <action name="ResizeRelative">
        <bottom>20</bottom>
      </action>
    </keybind>
    <keybind key="C-A-Up">
      <action name="ResizeRelative">
        <bottom>-20</bottom>
      </action>
    </keybind>
    <!-- Send Application to next/prev desktop -->
    <keybind key="S-C-A-Left">
      <action name="SendToDesktopLeft"/>
    </keybind>
    <keybind key="S-C-A-Right">
      <action name="SendToDesktopRight"/>
    </keybind>
    <!-- Media Controls-->
    <keybind key="XF86AudioRaiseVolume">
      <action name="Execute">
        <command>volume --inc</command>
      </action>
    </keybind>
    <keybind key="XF86AudioLowerVolume">
      <action name="Execute">
        <command>volume --dec</command>
      </action>
    </keybind>
    <keybind key="XF86AudioMute">
      <action name="Execute">
        <command>volume --toggle</command>
      </action>
    </keybind>
    <keybind key="XF86AudioStop">
      <action name="Execute">
        <command>playerctl stop</command>
      </action>
    </keybind>
    <keybind key="XF86AudioPlay">
      <action name="Execute">
        <command>playerctl play-pause</command>
      </action>
    </keybind>
    <keybind key="XF86AudioPrev">
      <action name="Execute">
        <command>playerctl previous</command>
      </action>
    </keybind>
    <keybind key="XF86AudioNext">
      <action name="Execute">
        <command>playerctl next</command>
      </action>
    </keybind>
    <!-- Brightness Control -->
    <keybind key="XF86MonBrightnessUp">
      <action name="Execute">
        <command>brightness --inc</command>
      </action>
    </keybind>
    <keybind key="XF86MonBrightnessDown">
      <action name="Execute">
        <command>brightness --dec</command>
      </action>
    </keybind>
    <!-- Screenshot Keys -->
    <keybind key="Print">
      <action name="Execute">
        <command>takeshot --now</command>
      </action>
    </keybind>
    <keybind key="A-Print">
      <action name="Execute">
        <command>takeshot --in5</command>
      </action>
    </keybind>
    <keybind key="S-Print">
      <action name="Execute">
        <command>takeshot --in10</command>
      </action>
    </keybind>
    <keybind key="C-Print">
      <action name="Execute">
        <command>takeshot --win</command>
      </action>
    </keybind>
    <keybind key="C-A-Print">
      <action name="Execute">
        <command>takeshot --area</command>
      </action>
    </keybind>
    <!-- ################################ Launch Applications ################################ -->
    <!-- Apps -->
    <keybind key="W-t">
      <action name="Execute">
        <command>alacritty</command>
      </action>
    </keybind>
    <keybind key="W-f">
      <action name="Execute">
        <command>thunar</command>
      </action>
    </keybind>
    <keybind key="W-w">
      <action name="Execute">
        <command>brave</command>
      </action>
    </keybind>
    <keybind key="W-e">
      <action name="Execute">
        <command>code</command>
      </action>
    </keybind>
    <!-- Rofi -->
    <keybind key="A-F1">
      <action name="Execute">
        <command>~/.config/openbox/rofi/bin/launcher</command>
      </action>
    </keybind>
    <keybind key="W-n">
      <action name="Execute">
        <command>networkmanager_dmenu</command>
      </action>
    </keybind>
    <keybind key="W-m">
      <action name="Execute">
        <command>~/.config/openbox/rofi/bin/music</command>
      </action>
    </keybind>
    <keybind key="W-x">
      <action name="Execute">
        <command>~/.config/openbox/rofi/bin/powermenu</command>
      </action>
    </keybind>
    <keybind key="W-s">
      <action name="Execute">
        <command>~/.config/openbox/rofi/bin/screenshot</command>
      </action>
    </keybind>
    <keybind key="W-i">
      <action name="Execute">
        <command>~/.config/openbox/rofi/bin/network</command>
      </action>
    </keybind>
    <keybind key="W-r">
      <action name="Execute">
        <command>~/.config/openbox/rofi/bin/runner</command>
      </action>
    </keybind>
    <keybind key="W-p">
      <action name="Execute">
        <command>color-gpick</command>
        <!--<command>color-picker</command>-->
      </action>
    </keybind>
    <keybind key="W-v">
      <action name="Execute">
        <command>tasks</command>
      </action>
    </keybind>
    <!-- CLI Apps -->
    <keybind key="C-A-t">
      <action name="Execute">
        <command>alacritty</command>
      </action>
    </keybind>
    <keybind key="C-A-v">
      <action name="Execute">
        <command>alacritty -e vim</command>
      </action>
    </keybind>
    <keybind key="C-A-n">
      <action name="Execute">
        <command>alacritty -e nvim</command>
      </action>
    </keybind>
    <keybind key="C-A-r">
      <action name="Execute">
        <command>alacritty -e ranger</command>
      </action>
    </keybind>
    <keybind key="C-A-h">
      <action name="Execute">
        <command>alacritty -e htop</command>
      </action>
    </keybind>
    <keybind key="C-A-b">
      <action name="Execute">
        <command>alacritty -e bashtop</command>
      </action>
    </keybind>
    <!-- Lockscreen -->
    <keybind key="C-A-l">
      <action name="Execute">
        <command>betterlockscreen --lock</command>
      </action>
    </keybind>
    <!-- Openbox -->
    <keybind key="C-S-Escape">
      <action name="Exit"/>
    </keybind>
    <keybind key="C-S-BackSpace">
      <action name="Restart"/>
    </keybind>
    <keybind key="C-S-R">
      <action name="Reconfigure"/>
    </keybind>
    <keybind key="W-Escape">
      <action name="Execute">
        <command>xkill</command>
      </action>
    </keybind>
    <keybind key="W-c">
      <action name="Close"/>
    </keybind>
    <keybind key="W-q">
      <action name="Close"/>
    </keybind>
    <keybind key="A-F5">
      <action name="Iconify"/>
    </keybind>
    <keybind key="A-F6">
      <action name="ToggleMaximize"/>
    </keybind>
    <keybind key="A-F7">
      <action name="ToggleDecorations"/>
    </keybind>
    <keybind key="W-d">
      <action name="ToggleShowDesktop"/>
    </keybind>
    <!-- Activate Move/Resize -->
    <keybind key="A-r">
      <action name="Resize"/>
    </keybind>
    <keybind key="A-m">
      <action name="Move"/>
    </keybind>
    <!-- Launch Openbox Menu -->
    <keybind key="W-space">
      <action name="ShowMenu">
        <menu>root-menu</menu>
      </action>
    </keybind>
    <keybind key="C-A-space">
      <action name="ShowMenu">
        <menu>app-menu</menu>
      </action>
    </keybind>
    <keybind key="A-space">
      <action name="ShowMenu">
        <menu>client-menu</menu>
      </action>
    </keybind>
  </keyboard>
  <!-- ################################ Mouse Settings ################################ -->
  <mouse>
    <dragThreshold>4</dragThreshold>
    <doubleClickTime>400</doubleClickTime>
    <screenEdgeWarpTime>600</screenEdgeWarpTime>
    <screenEdgeWarpMouse>false</screenEdgeWarpMouse>
    <context name="Frame">
      <mousebind action="Press" button="A-Left">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind action="Drag" button="W-Left">
        <action name="Move"/>
      </mousebind>
      <mousebind action="Press" button="A-Right">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind action="Drag" button="A-Right">
        <action name="Resize"/>
      </mousebind>
    </context>
    <context name="Titlebar">
      <mousebind action="Press" button="A-Left">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind action="Drag" button="A-Left">
        <action name="Move"/>
      </mousebind>
      <mousebind action="Press" button="Left">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind action="Drag" button="Left">
        <action name="if">
          <maximizedvertical>yes</maximizedvertical>
          <then>
            <action name="Unmaximize"/>
            <direction>vertical</direction>
            <action name="MoveResizeTo">
              <x>center</x>
              <y>current</y>
            </action>
            <action name="Move"/>
          </then>
          <else>
            <action name="Move"/>
          </else>
        </action>
      </mousebind>
      <mousebind action="DoubleClick" button="Left">
        <action name="ToggleMaximizeFull"/>
      </mousebind>
      <mousebind action="Click" button="Up">
        <action name="if">
          <shaded>no</shaded>
          <then>
            <action name="Shade"/>
            <action name="FocusToBottom"/>
            <action name="Unfocus"/>
            <action name="Lower"/>
          </then>
        </action>
      </mousebind>
      <mousebind action="Click" button="Down">
        <action name="if">
          <shaded>yes</shaded>
          <then>
            <action name="Unshade"/>
            <action name="Raise"/>
          </then>
        </action>
      </mousebind>
      <mousebind action="Press" button="Right">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="ShowMenu">
          <menu>client-menu</menu>
        </action>
      </mousebind>
    </context>
    <context name="Titlebar Top Right Bottom Left TLCorner TRCorner BRCorner BLCorner">
      <mousebind action="Press" button="Left">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind action="Press" button="Right">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="ShowMenu">
          <menu>client-menu</menu>
        </action>
      </mousebind>
    </context>
    <context name="Top">
      <mousebind action="Press" button="Left">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind action="Drag" button="Left">
        <action name="Resize">
          <edge>top</edge>
        </action>
      </mousebind>
    </context>
    <context name="Left">
      <mousebind action="Press" button="Left">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind action="Drag" button="Left">
        <action name="Resize">
          <edge>left</edge>
        </action>
      </mousebind>
    </context>
    <context name="Right">
      <mousebind action="Press" button="Left">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind action="Drag" button="Left">
        <action name="Resize">
          <edge>right</edge>
        </action>
      </mousebind>
    </context>
    <context name="Bottom">
      <mousebind action="Press" button="Left">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind action="Drag" button="Left">
        <action name="Resize">
          <edge>bottom</edge>
        </action>
      </mousebind>
    </context>
    <context name="TRCorner BRCorner TLCorner BLCorner">
      <mousebind action="Press" button="Left">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind action="Drag" button="Left">
        <action name="Resize"/>
      </mousebind>
    </context>
    <context name="Client">
      <mousebind action="Press" button="A-Left">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind action="Drag" button="A-Left">
        <action name="Move"/>
      </mousebind>
      <mousebind action="Press" button="Left">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind action="Press" button="Right">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
    </context>
    <context name="Icon">
      <mousebind action="Press" button="Right">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
        <action name="ShowMenu">
          <menu>client-menu</menu>
        </action>
      </mousebind>
    </context>
    <context name="AllDesktops">
      <mousebind action="Click" button="Left">
        <action name="ToggleOmnipresent"/>
      </mousebind>
    </context>
    <context name="Shade">
      <mousebind action="Click" button="Left">
        <action name="ToggleShade"/>
      </mousebind>
    </context>
    <context name="Iconify">
      <mousebind action="Click" button="Left">
        <action name="Iconify"/>
      </mousebind>
    </context>
    <context name="Maximize">
      <mousebind action="Press" button="Left">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind action="Press" button="Right">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind action="Click" button="Left">
        <action name="ToggleMaximize"/>
      </mousebind>
      <mousebind action="Click" button="Right">
        <action name="ToggleMaximize">
          <direction>horizontal</direction>
        </action>
      </mousebind>
    </context>
    <context name="Close">
      <mousebind action="Click" button="Left">
        <action name="Close"/>
      </mousebind>
    </context>
    <context name="Desktop">
      <mousebind action="Click" button="Left">
        <action name="Focus"/>
      </mousebind>
      <mousebind action="Click" button="A-Up">
        <action name="GoToDesktop">
          <to>previous</to>
        </action>
      </mousebind>
      <mousebind action="Click" button="A-Down">
        <action name="GoToDesktop">
          <to>next</to>
        </action>
      </mousebind>
    </context>
    <context name="Root">
      <mousebind action="Press" button="Middle">
        <action name="ShowMenu">
          <menu>client-list-combined-menu</menu>
        </action>
      </mousebind>
      <mousebind action="Press" button="A-Right">
        <action name="ShowMenu">
          <menu>client-list-combined-menu</menu>
        </action>
      </mousebind>
      <mousebind action="Press" button="Right">
        <action name="ShowMenu">
          <menu>root-menu</menu>
        </action>
      </mousebind>
    </context>
  </mouse>
  <!-- ################################ Menu Settings ################################ -->
  <menu>
    <file>menu-icons.xml</file>
    <hideDelay>400</hideDelay>
    <middle>no</middle>
    <submenuShowDelay>100</submenuShowDelay>
    <submenuHideDelay>200</submenuHideDelay>
    <applicationIcons>no</applicationIcons>
    <manageDesktops>yes</manageDesktops>
  </menu>
  <!-- ################################ Applications Rules ################################ -->
  <applications>
    <application class="*">
      <focus>yes</focus>
      <decor>yes</decor>
    </application>
    <application name="obconf">
      <position force="yes">
        <x>center</x>
        <y>center</y>
      </position>
      <size>
        <width>50%</width>
      </size>
    </application>
    <application title="MPlayer">
      <decor>no</decor>
    </application>
    <application title="Nitrogen">
      <position force="yes">
        <x>center</x>
        <y>center</y>
      </position>
    </application>
    <!--
  # this is an example with comments through out. use these to make your
  # own rules, but without the comments of course.
  # you may use one or more of the name/class/role/title/type rules to specify
  # windows to match

  <application name="the window's _OB_APP_NAME property (see obxprop)" class="the window's _OB_APP_CLASS property (see obxprop)" groupname="the window's _OB_APP_GROUP_NAME property (see obxprop)" groupclass="the window's _OB_APP_GROUP_CLASS property (see obxprop)" role="the window's _OB_APP_ROLE property (see obxprop)" title="the window's _OB_APP_TITLE property (see obxprop)" type="the window's _OB_APP_TYPE property (see obxprob)..
                      (if unspecified, then it is 'dialog' for child windows)">
  # you may set only one of name/class/role/title/type, or you may use more
  # than one together to restrict your matches.

  # the name, class, role, and title use simple wildcard matching such as those
  # used by a shell. you can use * to match any characters and ? to match
  # any single character.

  # the type is one of: normal, dialog, splash, utility, menu, toolbar, dock,
  #    or desktop

  # when multiple rules match a window, they will all be applied, in the
  # order that they appear in this list


    # each rule element can be left out or set to 'default' to specify to not
    # change that attribute of the window

    <decor>yes</decor>
    # enable or disable window decorations

    <shade>no</shade>
    # make the window shaded when it appears, or not

    <position force="no">
      # the position is only used if both an x and y coordinate are provided
      # (and not set to 'default')
      # when force is "yes", then the window will be placed here even if it
      # says you want it placed elsewhere.  this is to override buggy
      # applications who refuse to behave
      <x>center</x>
      # a number like 50, or 'center' to center on screen. use a negative number
      # to start from the right (or bottom for <y>), ie -50 is 50 pixels from
      # the right edge (or bottom). use 'default' to specify using value
      # provided by the application, or chosen by openbox, instead.
      <y>200</y>
      <monitor>1</monitor>
      # specifies the monitor in a xinerama setup.
      # 1 is the first head, or 'mouse' for wherever the mouse is
    </position>

    <size>
      # the size to make the window.
      <width>20</width>
      # a number like 20, or 'default' to use the size given by the application.
      # you can use fractions such as 1/2 or percentages such as 75% in which
      # case the value is relative to the size of the monitor that the window
      # appears on.
      <height>30%</height>
    </size>

    <focus>yes</focus>
    # if the window should try be given focus when it appears. if this is set
    # to yes it doesn't guarantee the window will be given focus. some
    # restrictions may apply, but Openbox will try to

    <desktop>1</desktop>
    # 1 is the first desktop, 'all' for all desktops

    <layer>normal</layer>
    # 'above', 'normal', or 'below'

    <iconic>no</iconic>
    # make the window iconified when it appears, or not

    <skip_pager>no</skip_pager>
    # asks to not be shown in pagers

    <skip_taskbar>no</skip_taskbar>
    # asks to not be shown in taskbars. window cycling actions will also
    # skip past such windows

    <fullscreen>yes</fullscreen>
    # make the window in fullscreen mode when it appears

    <maximized>true</maximized>
    # 'Horizontal', 'Vertical' or boolean (yes/no)
  </application>

  # end of the example
-->
  </applications>
</openbox_config>
<!-- vim:sw=2
-->
EOF

if [ -f "${HOME}/.config/openbox/rc.xml" ]; then
  info ">>> RC Config: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines ${HOME}/.config/openbox/rc.xml ${HOME}/.config/openbox/rc.xml.2)" ]; then
    info ">>> RC Config: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines ${HOME}/.config/openbox/rc.xml ${HOME}/.config/openbox/rc.xml.2
    mv ${HOME}/.config/openbox/rc.xml.2 ${HOME}/.config/openbox/rc.xml
  else
    info ">>> RC Config: No changes detected"
    mv {HOME}/.config/openbox/rc.xml.2 ${HOME}/.config/openbox/rc.xml
  fi
else
  info ">>> RC Config: No file detected, creating new file"
  mv {HOME}/.config/openbox/rc.xml.2 ${HOME}/.config/openbox/rc.xml
fi
