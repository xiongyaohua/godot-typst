#ifndef TYPST_CLASS_H
#define TYPST_CLASS_H

#include <godot_cpp/classes/node.hpp>
#include "bridge/bridge.h"

using namespace godot;

class Typst : public Node {
	GDCLASS(Typst, Node);

protected:
	static void _bind_methods();

public:
    uint64_t add(uint64_t a, uint64_t b) {
        return ::add(a, b);
    }

};

#endif