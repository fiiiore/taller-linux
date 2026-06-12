<?php

// ===============================
// CONFIG
// ===============================
$host     = 'localhost';
$username = 'gestion';
$password = '';
$dbname   = 'gestion_empresa';

// ===============================
// CONEXIÓN
// ===============================
$conn = new mysqli($host, $username, $password);

if ($conn->connect_error) {
    die("Error conexión: " . $conn->connect_error);
}

// ===============================
// CREAR BD
// ===============================
$conn->query("
CREATE DATABASE IF NOT EXISTS $dbname 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_general_ci
");

$conn->select_db($dbname);

// ===============================
// TABLAS
// ===============================
$queries = [

"CREATE TABLE IF NOT EXISTS clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  telefono VARCHAR(30),
  email VARCHAR(100)
)",

"CREATE TABLE IF NOT EXISTS empleados (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  cargo VARCHAR(50),
  salario DECIMAL(10,2)
)",

"CREATE TABLE IF NOT EXISTS proveedores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  telefono VARCHAR(30),
  email VARCHAR(100)
)",

"CREATE TABLE IF NOT EXISTS productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  precio DECIMAL(10,2),
  stock INT
)",

"CREATE TABLE IF NOT EXISTS facturas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT,
  empleado_id INT,
  fecha DATE,
  total DECIMAL(10,2)
)",

"CREATE TABLE IF NOT EXISTS detalle_factura (
  id INT AUTO_INCREMENT PRIMARY KEY,
  factura_id INT,
  producto_id INT,
  cantidad INT,
  subtotal DECIMAL(10,2)
)",

"CREATE TABLE IF NOT EXISTS ventas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT,
  total DECIMAL(10,2),
  fecha DATE
)",

"CREATE TABLE IF NOT EXISTS gastos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  concepto VARCHAR(100),
  monto DECIMAL(10,2),
  fecha DATE
)"

];

// ===============================
// EJECUTAR TABLAS (SIN OUTPUT)
// ===============================
foreach($queries as $q){
    $conn->query($q);
}

// ===============================
// INSERTS SOLO SI ESTÁ VACÍO
// ===============================

// CLIENTES
$res = $conn->query("SELECT COUNT(*) as c FROM clientes");
$row = $res->fetch_assoc();

if($row['c'] == 0){

    $clientes = [
        ['Juan Perez','2211234567','juan@gmail.com'],
        ['Maria Gomez','2217654321','maria@gmail.com'],
        ['Carlos Lopez','2211111113','carlos.lopez@gmail.com'],
        ['Ana Martinez','2211111114','ana.martinez@gmail.com']
    ];

    foreach($clientes as $c){
        $conn->query("
            INSERT INTO clientes(nombre,telefono,email)
            VALUES('$c[0]','$c[1]','$c[2]')
        ");
    }
}

// GASTOS
$res = $conn->query("SELECT COUNT(*) as c FROM gastos");
$row = $res->fetch_assoc();

if($row['c'] == 0){

    $gastos = [
        ['Internet',25000,'2026-06-01'],
        ['Electricidad',18000,'2026-06-02'],
        ['Renta oficina',50000,'2026-06-01'],
        ['Servicios',12000,'2026-06-02']
    ];

    foreach($gastos as $g){
        $conn->query("
            INSERT INTO gastos(concepto,monto,fecha)
            VALUES('$g[0]',$g[1],'$g[2]')
        ");
    }
}

// EMPLEADOS
$res = $conn->query("SELECT COUNT(*) as c FROM empleados");
$row = $res->fetch_assoc();

if($row['c'] == 0){

    $empleados = [
        ['Juan Perez','Gerente',50000],
        ['Maria Garcia','Vendedora',30000],
        ['Carlos Lopez','Operario',25000],
        ['Ana Martinez','Asistente',20000]
    ];

    foreach($empleados as $e){
        $conn->query("
            INSERT INTO empleados(nombre,cargo,salario)
            VALUES('$e[0]','$e[1]',$e[2])
        ");
    }
}

// PROVEEDORES
$res = $conn->query("SELECT COUNT(*) as c FROM proveedores");
$row = $res->fetch_assoc();

if($row['c'] == 0){

    $proveedores = [
        ['Distribuidor ABC','2211111111','abc@supplier.com'],
        ['Supplier XYZ','2222222222','xyz@supplier.com'],
        ['Global Import','2233333333','global@supplier.com']
    ];

    foreach($proveedores as $p){
        $conn->query("
            INSERT INTO proveedores(nombre,telefono,email)
            VALUES('$p[0]','$p[1]','$p[2]')
        ");
    }
}

// PRODUCTOS
$res = $conn->query("SELECT COUNT(*) as c FROM productos");
$row = $res->fetch_assoc();

if($row['c'] == 0){

    $productos = [
        ['Laptop Dell',1200,15],
        ['Mouse Logitech',25,50],
        ['Teclado Mecanico',85,30],
        ['Monitor LG 24',300,12],
        ['Cable HDMI',10,100],
        ['Webcam HD',45,25]
    ];

    foreach($productos as $p){
        $conn->query("
            INSERT INTO productos(nombre,precio,stock)
            VALUES('$p[0]',$p[1],$p[2])
        ");
    }
}

// VENTAS
$res = $conn->query("SELECT COUNT(*) as c FROM ventas");
$row = $res->fetch_assoc();

if($row['c'] == 0){

    $ventas = [
        [1,2500,'2026-06-01'],
        [2,150,'2026-06-02'],
        [3,3200,'2026-06-02'],
        [1,850,'2026-06-03'],
        [4,2800,'2026-06-04'],
        [2,420,'2026-06-04'],
        [3,1200,'2026-06-05']
    ];

    foreach($ventas as $v){
        $conn->query("
            INSERT INTO ventas(cliente_id,total,fecha)
            VALUES($v[0],$v[1],'$v[2]')
        ");
    }
}

?>