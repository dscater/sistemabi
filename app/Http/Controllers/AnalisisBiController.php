<?php

namespace App\Http\Controllers;

use App\Models\FechaStock;
use App\Models\KardexProducto;
use App\Models\Producto;
use DateTimeImmutable;
use Illuminate\Http\Request;

class AnalisisBiController extends Controller
{
    public function stock_productos1()
    {
        $productos = Producto::all();
        $datos = [];
        foreach ($productos as $producto) {
            $datos[] = [$producto->nombre, (float)$producto->stock_actual];
        }

        return response()->JSON(["datos" => $datos]);
    }
    public function stock_productos2(Request $request)
    {
        $fecha_ini = date("Y-m-d", strtotime($request->fecha_ini));
        $fecha_fin = date("Y-m-d", strtotime($request->fecha_fin));
        $filtro = $request->filtro;
        $producto = $request->producto;

        $productos = Producto::all();
        if ($filtro != 'TODOS' && $producto && $producto != "TODOS") {
            $productos = Producto::where("id", $producto)->get();
        }

        $datos = [];
        foreach ($productos as $o_prod) {
            $aux_ini = $fecha_ini;
            $data = [];
            while ($aux_ini <= $fecha_fin) {
                // si no existe registros con la fecha inicial
                // verificar si existen registros en el kardex y obtener el ultimo registro
                $fecha_stock = FechaStock::where("fecha", $aux_ini)->where("producto_id", $o_prod->id)->get()->first();
                $stock = 0;
                if ($fecha_stock) {
                    $stock = $fecha_stock->stock;
                } else {
                    $ultimo_registro_kardex = KardexProducto::where("producto_id", $o_prod->id)
                        ->where("fecha", "<", $aux_ini)
                        ->get()->last();
                    if ($ultimo_registro_kardex) {
                        $stock = $ultimo_registro_kardex->cantidad_saldo;
                    }
                }
                // $data[] = [date("d-m-y",strtotime($aux_ini)), (float)$stock];
                $data[] = (float)$stock;
                $aux_ini = date("Y-m-d", strtotime($aux_ini . "+1 days"));
            }
            $datos[] = [
                "data" => $data,
                "name" => $o_prod->nombre
            ];
        }
        return response()->JSON([
            "datos" => $datos,
            "inicio" => $fecha_ini
        ]);
    }
    public function stock_productos3(Request $request)
    {
        $anio = $request->anio;
        $mes = $request->mes;
        $filtro = $request->filtro;
        $producto = $request->producto;
        $meses = ["01" => "Enero", "02" => "Febrero", "03" => "Marzo", "04" => "Abril", "05" => "Mayo", "06" => "Junio", "07" => "Julio", "08" => "Agosto", "09" => "Septiembre", "10" => "Octubre", "11" => "Noviembre", "12" => "Diciembre"];

        $fecha_armada = $anio . '-' . $mes . '-01';
        $mes_anterior1 = date("Y-m", strtotime($fecha_armada . '-1 month'));
        $mes_anterior2 = date("Y-m", strtotime($fecha_armada . '-2 month'));
        $mes_anterior3 = date("Y-m", strtotime($fecha_armada . '-3 month'));

        // verificar si existen registros en ese anio y mes en el kardex
        // si no existe asignar el stock de uno de los que si encuentra si no encuentra mostrar 0

        $productos = Producto::all();
        if ($filtro != "TODOS" && $producto != "TODOS") {
            $productos = Producto::where("id", $producto)->get();
        }

        $datos = [];
        foreach ($productos as $o_prod) {
            $promedio = 0;
            $kardex1 = KardexProducto::where("producto_id", $o_prod->id)->where("fecha", "LIKE", "$mes_anterior1%")->get()->last();
            if ($kardex1) {
                $promedio += $kardex1->cantidad_saldo;
            }
            $kardex2 = KardexProducto::where("producto_id", $o_prod->id)->where("fecha", "LIKE", "$mes_anterior2%")->get()->last();
            if ($kardex2) {
                $promedio += $kardex2->cantidad_saldo;
            }
            $kardex3 = KardexProducto::where("producto_id", $o_prod->id)->where("fecha", "LIKE", "$mes_anterior3%")->get()->last();
            if ($kardex3) {
                $promedio += $kardex3->cantidad_saldo;
            }
            $promedio = $promedio / 3;
            $datos[] = [$o_prod->nombre, (int)$promedio];
        }

        return response()->JSON([
            "mes_anio" => mb_strtoupper($meses[$mes]) . " DE " . $anio,
            "datos" => $datos
        ]);
    }
    public function proveedors1(Request $request)
    {
    }
    public function proveedors2(Request $request)
    {
    }
    public function proveedors3(Request $request)
    {
    }
    public function ventas1(Request $request)
    {
    }
    public function ventas2(Request $request)
    {
    }
    public function ventas3(Request $request)
    {
    }
    public function clientes1(Request $request)
    {
    }
    public function clientes2(Request $request)
    {
    }
    public function clientes3(Request $request)
    {
    }
}
