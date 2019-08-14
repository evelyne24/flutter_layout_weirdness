# layout_weirdness

Try to get this layout to work 🤯

[Update]: The last commit "fixes" the layout, however if any of the children is a `LayoutBuilder` things blow up, as `LayoutBuilder` and `IntrinsicHeight` don't play nice together. There's a PR open here: https://github.com/flutter/flutter/pull/38550

# Description

This is a fairly straightforward layout but very hard to nail down in Flutter. It shouldn't be this hard.

The point is to have a reusable widget that contains a footer and some children. The footer should stay at the bottom of the screen, no matter if the content is enough to fill the view port or not. If the content is overflowing, the layout should scroll. Kind of like `fill_viewport` in Android `ScrollView`. 

I want to be able to have a child that expands and centers on the screen if there is empty space, while the footer stays put at the bottom.

I want to be able to use all kind of widgeds as children, including a `LayoutBuilder`.


![Screenshot1](Screenshot1.png)
![Screenshot1](Screenshot2.png)
![Screenshot1](Screenshot3.png)
