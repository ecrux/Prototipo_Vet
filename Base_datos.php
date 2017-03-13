<?php 
/**
	Autor: Edwar Cruz
	fecha: 07/02/2017
	Descripción: Esta mi clase de base de datos para conectarla

*/	
	class Base_datos
	{

		public $conexion;//Publico la conexion 

		/* 
			Esta me permite asignar el valor automatico a la variable publicada anteriormente
			constructores
		*/


		/**
		* Este método me eprmite establecer ua conexión a la base de datos.
		* Publica en el atributo conexion la conexión.
		*/
		function Base_datos(){
			$this->conexion= $this->crear_conexion(); 
		}




		/**
		*Aqui se crea la conexion  la base de datos incluyendo el archivo config el cual contiene los parametros de la base de datos.
		* @return 	text retorna la conexión a la bd. 
		*/
		function crear_conexion()
		{	
			include'config.php'; 
			return mysqli_connect($servidor,$usuario,$password,$bd);
			//$this->conexion=$conexion;
			 //$conexion;
			//$resultado= $conexion -> query($sql);
		}

		/**
		*Esta es una consulta la cual se puede tener la condición nula y retorna un resultado.
		* @param 	text 	Agrem
		*/
		function consultar_tabla($tabla, $campos, $condicion=null)
		{
			$sql="SELECT $campos FROM $tabla ";
			if ($condicion!=null)$sql.=" WHERE $condicion";
			$resultado= ($this->conexion) -> query($sql);
			//echo $sql;
			return $resultado;
		}

		function imprimir_mensaje()
		{
			return "Esta funcionando la heriencia";
		}


		function leer_campo($tabla)
		{
			$salida="";
			$sql="SELECT * FROM $tabla";
			$resultado= ($this->conexion) -> query($sql);
			if (mysqli_num_rows($resultado)>0) {
				$salida.="<SELECT id='select' name='sintomas[] ' MULTIPLE='multiple' size='25' onclick='al_dar_clic_en_listaa()' class='form-control'>";
					$i=0;
					while ($fila=mysqli_fetch_array($resultado)) 
					{
						$i++;
						$salida.="<OPTION VALUE='$fila[0]'>".$i . " - " . $fila[1] ."</OPTION>";
					}
				$salida.="</SELECT>";
				//echo $sql;
			}else{
				$salida.="No se encontraron resultados";
			}
			return $salida;
		}

		function calcular_enfermedad($sintoma)
		{
			$salida="";
			$sql="";
			$sql.=  "SELECT url, enfermedad , COUNT(t1.id_enfermedad) as conteo_sintomas , ";
		    $sql.= " (SELECT COUNT(t4.id_enfermedad) conteo_total ";
		    $sql.= " FROM tb_relacion t4 ";
		    $sql.= "  where t1.id_enfermedad = t4.id_enfermedad ";
		    $sql.= " GROUP BY id_enfermedad) as conteo_total  ";
		    $sql.= " FROM tb_relacion t1, tb_enfermedades t2 ";
		    $sql.= " WHERE t1.id_enfermedad = t2.id_enfermedad AND id_sintoma in (".$sintoma.") ";
		    $sql.= " GROUP BY t1.id_enfermedad";
			//echo $sql . "<br> <br>";
			//=$sintoma;
			echo "Sintomas seleccionados : " . $sintoma. "<br><br>";
			include 'config.php';
			$resultado= ($this->conexion) -> query($sql);
			//$row= mysqli_num_rows($resultado);
			//echo $row;
			//$resultado= $this->conexion -> query($sql);
			//echo $resultado;
			/*$row =mysqli_num_rows($resultado);
			echo $row;*/
			$conteo="";
				if (mysqli_num_rows($resultado)>0) {
						while ($fila=mysqli_fetch_assoc($resultado))
						{
							if ($fila['conteo_sintomas'] >= $conteo) {
								$conteo= $fila['conteo_sintomas'];
								$salida .="<center>". $this->colocar_imagen($fila['url'] , '50%' ) . "</center>";
								$salida .="<b>Enfermedad : " .  $fila['enfermedad'] . "</b><br>";
								$salida .="La cantidad de seleccionados en esta enfermedad: ". $fila['conteo_sintomas'] . "<br>";
								$salida .="La cantidad total de sintomas de esta enfermedad : ". $fila['conteo_total']. "<br>";
								if ($fila['conteo_sintomas']==$fila['conteo_total']) {
									$salida.= "<b>Esta es la enfermedad que tiene su mascota ya que posee todos los sintomas de esta enfermedad</b> <br>";
								}else{
									$salida.= "<b>Esta puede ser una de las enfermedades que tiene su mascota, ya que posee ".$fila['conteo_sintomas']. " sintomas de " .$fila['conteo_total']." sintomas </b> <br>";
								}
								$salida.="<br>";
							}
						}
							$salida.= "<br>Esta son las enfermedades que mas se acercan a los sintomas que tiene su mascota";
				}else{
					$salida.="No se encontro ningún resultado";
				}
				
			return $salida;

		}
	}




 ?>
