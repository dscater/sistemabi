<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IngresoProducto extends Model
{
    use HasFactory;

    protected $fillable = [
        "lugar", "producto_id", "proveedor_id", "precio_compra", "cantidad", "tipo_ingreso_id", "descripcion", "fecha_registro",
    ];

    protected $appends = ["nombre_producto", "nombre_producto_full"];

    public function getNombreProductoAttribute()
    {
        return $this->producto->nombre;
    }

    public function getNombreProductoFullAttribute()
    {
        return $this->producto->codigo . ' | ' . $this->producto->nombre . ' | ' . $this->producto->medida;
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');
    }

    public function proveedor()
    {
        return $this->belongsTo(Proveedor::class, 'proveedor_id');
    }
    public function tipo_ingreso()
    {
        return $this->belongsTo(TipoIngreso::class, 'tipo_ingreso_id');
    }
}
