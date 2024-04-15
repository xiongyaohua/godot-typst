#include "typst.h"
#include <godot_cpp/core/class_db.hpp>

void Typst::_bind_methods() {
	ClassDB::bind_method(D_METHOD("add", "left", "right"), &Typst::add);
}