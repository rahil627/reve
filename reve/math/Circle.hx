package reve.math;

import h2d.col.Circle as HeapsCircle;

@:forward(collideBounds)
abstract Circle(HeapsCircle) from HeapsCircle to HeapsCircle {

    public var center(get, set): Vector;
    public var radius(get, set): Float;
    public var bounds(get, never): Rectangle;

    public function new(center: Vector, radius: Float) {
        this = new HeapsCircle(center.x, center.y, radius);
    }

    public inline function contains(point: Vector): Bool {
        return this.contains(point);
    }

    public inline function distanceTo(point: Vector): Float {
        return (point - center).length - radius;
    }

    private inline function get_center(): Vector {
        return new Vector(this.x, this.y);
    }

    private inline function set_center(v: Vector): Vector {
        this.x = v.x;
        this.y = v.y;
        return v;
    }

    private inline function get_radius(): Float {
        return this.ray;
    }

    private inline function set_radius(v: Float): Float {
        return this.ray = v;
    }

    private inline function get_bounds(): Rectangle {
        final topleft = center - Vector.one * radius;
        return new Rectangle(topleft, Vector.one * 2 * radius);
    }
} 