<?php 
include 'Operaciones.php';
$mi_obj = New Operaciones; ?>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="listas01.js">
		alert('hola');
	</script>
	<title>
		Mi veterinaria
	</title>
</head>
<body>
	<form action="" method="POST">   
		Sintomas: <br>   
		<?php echo $mi_obj->leer_campo('tb_sintomas'); ?>
		<input type="hidden" name="sintoma" id="contenedor-salida">
		<input type="submit" value="Enviar datos!" > 
	</form>
	 <div id="contenedor-salida"></div>
	 <?php 
	 if ($_POST) 
	 {
		//echo $_POST['sintoma'];
		echo "<br>".$mi_obj->calcular_enfermedad($_POST['sintomas'],$_POST['sintoma']);
	 }
	?>
	<a href="ir">ir</a>
</body>
</html>
