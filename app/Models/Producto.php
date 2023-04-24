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
    public static function incrementarStock($producto, $cantidad, $lugar)
    {
        if ($lugar == 'ALMACEN') {
            if (!$producto->almacen) {
                $producto->almacen()->create([
                    "stock_actual" => $cantidad
                ]);
            } else {
                $producto->almacen->stock_actual = (float)$producto->almacen->stock_actual + $cantidad;
                $producto->almacen->save();
            }
        } else {
            $stock_sucursal = $producto->stock_sucursal;
            if (!$stock_sucursal) {
                $producto->stock_sucursal()->create([
                    "stock_actual" => $cantidad
                ]);
            } else {
                $stock_sucursal->stock_actual = (float)$stock_sucursal->stock_actual + $cantidad;
                $stock_sucursal->save();
            }
        }
        return true;
    }
    public static function decrementarStock($producto, $cantidad, $lugar)
    {
        if ($producto->descontar_stock == 'SI') {
            if ($lugar == 'ALMACEN') {
                $producto->almacen->stock_actual = (float)$producto->almacen->stock_actual - $cantidad;
                $producto->almacen->save();
            } else {
                $stock_sucursal = $producto->stock_sucursal;
                $stock_sucursal->stock_actual = (float)$stock_sucursal->stock_actual - $cantidad;
                $stock_sucursal->save();
            }
        }
        return true;
    }
}
