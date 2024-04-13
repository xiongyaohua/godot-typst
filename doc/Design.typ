= Introduction

The intention of this project is to use Godot as a presenting tool with the help of Typst. Godot, as an game engine, is good at showing motion graphics, 3D models and providing interactivity. One the other hand, Typst is good at typesetting texts especially those mixed with math. So they are a perfect match.


= How it should work

- This plugin provides a `TypstPages` node.
- Write `.typ` files for the slides.
- Add a `TypstPages` instance in the scene tree.
- Attach `.typ` files to it.
- Attach other Godot scenes as child for the `TypstPages` instance.
- `TypstPages` node handles page changing, and which scenes should show/hide accordingly.


= How to bind

Two bindings are considered:
+ `gdrust`
+ `godot-cpp` + `cxx`

The second one is choosn. While gdrust is a direct binding to Rust language, use godot-cpp is more preferable for the following reasons:

+ `godot-cpp` is officially supported by Godot developers. As result, it is more mature and following new Godot versions more closely.
+ The `godot-cpp` API mimics Godot internal API closely. This similarity leaves the door open, to integrate Typst directly into the engine as a module, achieving better performance.
+ `cxx` is used instead of `cbindgen`, to reduce chance of type mistakes.


= Other Considerations

- Use only containers provided by `godot-cpp` when possible, to ease potential porting to module.


= TODO

- Setup project files, check all parts work(`cxx`, `scons`, `godot-cpp`)
- Add `TypstPages`
