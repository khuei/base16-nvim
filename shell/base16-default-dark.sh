#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Default Dark scheme by Chris Kempson (http://chriskempson.com)

color00="18/18/18" # Base 00 - Black
color01="ab/46/42" # Base 08 - Red
color02="a1/b5/6c" # Base 0B - Green
color03="f7/ca/88" # Base 0A - Yellow
color04="7c/af/c2" # Base 0D - Blue
color05="ba/8b/af" # Base 0E - Magenta
color06="86/c1/b9" # Base 0C - Cyan
color07="d8/d8/d8" # Base 05 - White
color08="58/58/58" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="f8/f8/f8" # Base 07 - Bright White
color16="dc/96/56" # Base 09
color17="a1/69/46" # Base 0F
color18="28/28/28" # Base 01
color19="38/38/38" # Base 02
color20="b8/b8/b8" # Base 04
color21="e8/e8/e8" # Base 06
color_foreground="d8/d8/d8" # Base 05
color_background="18/18/18" # Base 00

if [ -n "$TMUX" ]; then
	put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' "$@"; }
	put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' "$@"; }
	put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' "$@"; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
	put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' "$@"; }
	put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' "$@"; }
	put_template_custom() { printf '\033P\033]%s%s\007\033\\' "$@"; }
elif [ "${TERM%%-*}" = "linux" ]; then
	put_template() { [ "$1" -lt 16 ] && printf "\e]P%x%s" "$1" "$(echo "$2" | sed 's/\///g')"; }
	put_template_var() { true; }
	put_template_custom() { true; }
else
	put_template() { printf '\033]4;%d;rgb:%s\033\\' "$@"; }
	put_template_var() { printf '\033]%d;rgb:%s\033\\' "$@"; }
	put_template_custom() { printf '\033]%s%s\033\\' "$@"; }
fi

# 16 color space
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
	put_template_custom Pg d8d8d8 # foreground
	put_template_custom Ph 181818 # background
	put_template_custom Pi d8d8d8 # bold color
	put_template_custom Pj 383838 # selection color
	put_template_custom Pk d8d8d8 # selected text color
	put_template_custom Pl d8d8d8 # cursor
	put_template_custom Pm 181818 # cursor text
else
	put_template_var 10 $color_foreground
	if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
		put_template_var 11 $color_background
		if [ "${TERM%%-*}" = "rxvt" ]; then
			put_template_var 708 $color_background # internal border (rxvt)
		fi
	fi
	put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
