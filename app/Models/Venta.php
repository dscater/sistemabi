<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id", "cliente_id", "nit", "total", "descuento", "total_final", "estado", "fecha_registro",
    ];

    protected $appends = ["editable", "fecha_formateado", "hora", "nro_orden"];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }

    public function detalle_ventas()
    {
        return $this->hasMany(DetalleVenta::class, 'venta_id');
    }

    public function getNroOrdenAttribute()
    {
        $nro = $this->id;
        if ($nro < 10) {
            $nro = '00' . $nro;
        } elseif ($nro < 100) {
            $nro = '0' . $nro;
        }

        return $nro;
    }
    public function getFechaFormateadoAttribute()
    {
        return date("d/m/Y", strtotime($this->created_at));
    }

    public function getHoraAttribute()
    {
        return date("H:i", strtotime($this->created_at));
    }

    public function getEditableAttribute()
    {
        if ($this->devolucion) {
            return false;
        }
        return true;
    }
}
