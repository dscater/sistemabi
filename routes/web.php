<?php

use App\Http\Controllers\ClienteController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\HistorialAccionController;
use App\Http\Controllers\IngresoProductoController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\VentaController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\ProveedorController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\SalidaProductoController;
use App\Http\Controllers\TipoIngresoController;
use App\Http\Controllers\TipoSalidaController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

// LOGIN
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);

// CONFIGURACIÓN
Route::get('/configuracion/getConfiguracion', [ConfiguracionController::class, 'getConfiguracion']);

Route::middleware(['auth'])->group(function () {
    Route::post('/configuracion/update', [ConfiguracionController::class, 'update']);

    Route::prefix('admin')->group(function () {
        // Usuarios
        Route::get('usuarios/getUsuario/{usuario}', [UserController::class, 'getUsuario']);
        Route::get('usuarios/userActual', [UserController::class, 'userActual']);
        Route::get('usuarios/getInfoBox', [UserController::class, 'getInfoBox']);
        Route::get('usuarios/getPermisos/{usuario}', [UserController::class, 'getPermisos']);
        Route::get('usuarios/getEncargadosRepresentantes', [UserController::class, 'getEncargadosRepresentantes']);
        Route::post('usuarios/actualizaContrasenia/{usuario}', [UserController::class, 'actualizaContrasenia']);
        Route::post('usuarios/actualizaFoto/{usuario}', [UserController::class, 'actualizaFoto']);
        Route::resource('usuarios', UserController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Proveedores
        Route::resource('proveedors', ProveedorController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Productos
        Route::post("productos/excel", [ProductoController::class, 'excel']);
        Route::get("productos/paginado", [ProductoController::class, 'paginado']);
        Route::get("productos/verifica_ventas", [ProductoController::class, 'verifica_ventas']);
        Route::get("productos/valida_stock", [ProductoController::class, 'valida_stock']);
        Route::get("productos/productos_sucursal", [ProductoController::class, 'productos_sucursal']);
        Route::get("productos/getStock", [ProductoController::class, 'getStock']);
        Route::get("productos/buscar_producto", [ProductoController::class, 'buscar_producto']);
        Route::resource('productos', ProductoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Tipo Ingresos
        Route::resource('tipo_ingresos', TipoIngresoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Ingreso productos
        Route::resource('ingreso_productos', IngresoProductoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Tipo Salidas
        Route::resource('tipo_salidas', TipoSalidaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Salida productos
        Route::resource('salida_productos', SalidaProductoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Clientes
        Route::resource('clientes', ClienteController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Ventas
        Route::post("ventas/pdf/{venta}", [VentaController::class, 'pdf']);
        Route::get("ventas/info/getLiteral", [VentaController::class, 'getLiteral']);
        Route::get("ventas/info/devolucions", [VentaController::class, 'getDevolucions']);
        Route::resource('ventas', VentaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // historial acciones
        Route::resource('historial_accions', HistorialAccionController::class)->only([
            'index', 'show'
        ]);

        // REPORTES
        Route::post('reportes/usuarios', [ReporteController::class, 'usuarios']);
        Route::post('reportes/kardex', [ReporteController::class, 'kardex']);
        Route::post('reportes/ventas', [ReporteController::class, 'ventas']);
        Route::post('reportes/stock_productos', [ReporteController::class, 'stock_productos']);
        Route::post('reportes/historial_accion', [ReporteController::class, 'historial_accion']);
        Route::post('reportes/grafico_ingresos', [ReporteController::class, 'grafico_ingresos']);
        Route::post('reportes/grafico_orden', [ReporteController::class, 'grafico_orden']);
    });
});


// ---------------------------------------
Route::get('/{optional?}', function () {
    return view('app');
})->name('base_path')->where('optional', '.*');
