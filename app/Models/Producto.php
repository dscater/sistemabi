<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    protected $fillable = [
        "codigo_almacen", "codigo_producto", "nombre", "descripcion", "precio",
        "stock_min", "stock_actual", "imagen", "fecha_registro",
    ];

    protected $appends = ["url_imagen"];


    public function getUrlImagenAttribute()
    {
        if ($this->imagen && trim($this->imagen)) {
            return asset("imgs/productos/" . $this->imagen);
        }
        return asset("imgs/productos/default.png");
    }


    // FUNCIONES PARA INCREMETAR Y DECREMENTAR EL STOCK
    public static function incrementarStock($producto, $cantidad)
    {
        $producto->stock_actual = (float)$producto->stock_actual + $cantidad;
        $producto->save();
        return true;
    }
    public static function decrementarStock($producto, $cantidad)
    {
        $producto->stock_actual = (float)$producto->stock_actual - $cantidad;
        $producto->save();

        return true;
    }
}
