# polybar-cmus

Basic cmus module for polybar

```ini
[module/cmus]
type = custom/script

exec = ~/.config/polybar/cmus.sh
exec-if = pgrep -x cmus
interval = 1

click-left = cmus-remote --next
click-right = cmus-remote --prev
click-middle = cmus-remote --pause
scroll-up = cmus-remote --volume +5%
scroll-down = cmus-remote --volume -5%

format = <label>
label = %output%
label-maxlen = 100
```
