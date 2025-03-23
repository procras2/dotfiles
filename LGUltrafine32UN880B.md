# Model 32UN880B #

## Specifications ##

- 31.5" UHD 4K (3840x2160) IPS
- 16:9 Ration
- 32" with 31.5" visible
- Ports 
  - HDMI * 2
  - DisplayPort * 1 DP Version 1.4
  - USB-C * 1 (Max. Resolution at Hz) 3840 x 2160 at 60Hz, (Data
    Transsmission), (Power Delivery) 60W
  - USB Downstream Port * 2 ver3.0
  - Headphone out, 3-pole (Sound Only)
- Inbuilt speaker

## Purchased ##

21 Sept 2022 (bought 2 one in Aoife room, one in upstairs office) from
elara.ie


## 16:9 ratio resolutions ##

16 / 9 = 1.7777777

| x    | y    | Aka     | x / 16 |
|:----:|:----:|:--------|:------:|
| 3840 | 2160 | UHD 4K  | 240    |
| 2560 | 1440 | 1440    | 160    |
| 1920 | 1080 | Full HD | 120    |
| 1280 | 720  | 720     | 80     |

## My measurements ##

Measure the horizontal part Just under 28" or 70.9 cm

3840 / 27.9 = 137.6 dots per inch (dpi)

Measure the verticle part at 15 3/4 " or 39.9 cm

2160 / 15.7 = 137.6 dots per inch

Nominal X dpi is routinely set to 96

Table of scaling

| Base dpi | `dpi_scale` | Calculation | New dpi |
|----------|-------------|-------------|---------|
| 96       | 1.0         | 96 * 1.0    | 96      |
| 96       | 2.0         | 96 * 2.0    | 192     |


## Setting Xft.dpi  ##

[HiDPI in i3](https://gregroz.me/article/i3-hidpi "Greg Rozdialik")

So we can change our settings for the monitor

```sh

Xft.dpi: 96

```sh

Change this to 

Xft.dpi: 192

This is a scaling `dpi_scale` of 2.0

When we apply this scale the monitor will appear to have half the
resolution. Instead of having an x resolution of 3840, it will appear
to have an x resolution of 3840 / 2 that is 1920. Indeed the monitor
will look like a blow up version of 1920 x 1080.

We probably don't want this amount of increased size so we will have
move in the opposite direction. 

There are two choices

1. Use a lower Xft.dpi
1. Use scaling with xrandr

It would seem that rather than setting Xft.dpi to the real dpi, we are
better off setting it to an integer multiple of 96 and then using a
float correction on xrandr scale.

We will also have to apply the dpi_scale factor to font definitions
and settings. As these are hand coded in config files there is no easy
way to have them calculated when the config is loaded.

What we could do is make templates for the set up and then generate
the files that are to be used, depending on the scaling we need.

## xrandr scale option ##

Our monitor is 3840  (x)

We want to be looking at it as if it was 2560 (x) * 1440 (y)

The `dpi_scale` we have set in Xft.dpi: 192 is a `dpi_scale` of 2

`xrandr_scale` = `wanted_resolution` * `dpi_scale` / `monitor_resolution`

For the variables above

`wanted_resolution` = 2560
`monitor_resolution` = 3840
`dpi_scale` = 2

`xrandr_scale` = ( 2560 * 2 ) / 3840 = 1.3333333

Now our xrandr command would look like

```bash

xrandr --output HDMI-0 --auto --scale 1.33333333333x1.33333333333

```bash

## Other DPI related changes ##

We will just use the `dpi_scale`  of 2 to mulitply the pixel size we
want
So if we want 16 px set it to 16 * 2 = 32 px

- i3 font
- i3 bar font size
- rofi font size
- GDK applications DPI
- Xcursor.size
- dunst font size


### i3 font ###

Set in .config/i3/config

base size 16 for scale of 1, then use 32 for scale of 2

	font pango:Firacode Nerd Font Mono 32px;

For normal resolution

	font pango:Firacode Nerd Font Mono 16px;


### i3bar font ###

Set in .config/i3/config

For HiDPI

	font pango:FiraCode Nerd Font Mono, FontAwesome 32px

For normal resolution

	font pango:FiraCode Nerd Font Mono, FontAwesome 16px


### rofi font size ###


Set in 

	.config/rofi/config.rasi
	
font: "mono {{ math.Mul 16 (ds "config").dpi }}px";

