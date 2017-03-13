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
				$salida.="<SELECT id='select' name='sintomas[] ' MULTIPLE='multiple' size='6' onclick='al_dar_clic_en_listaa()'>";
					while ($fila=mysqli_fetch_array($resultado)) 
					{
						$salida.="<OPTION VALUE='$fila[0]'>".$fila[1] ."</OPTION>";
					}
				$salida.="</SELECT>";
				//echo $sql;
			}else{
				$salida.="No se encontraron resultados";
			}
			return $salida;
		}

		function calcular_enfermedad($sintomas,$sintoma)
		{
			$salida="";
			$sintoma=$_POST['sintoma'];
			//echo $sintoma;
			$sintomas=$_POST["sintomas"]; 
		 	$dato="";
			$sql="";//Sql para los dastos 
			$cantidad=0; //Sql para traer el conteo
				$sql.="SELECT * , $sintoma";
				$sql.=" FROM tb_relacion t1, tb_enfermedades t2, tb_sintomas t3 where  t1.id_sintoma = t3.id_sintoma AND";
				$sql.=" t2.id_enfermedad = t1.id_enfermedad AND";
				$sql.= " t1.id_sintoma in (";
				for ($i=0;$i<count($sintomas);$i++)    
				{     
					$dato= $sintomas[$i];    
					$sql.= " '$dato' ";
					if ($i<(count($sintomas)-1))$sql.= ",";
					//if ($i < (count($sintomas)-1) ) $sql.=" UNION ";		
				/*****************************************************************************/    
					//if ($i < (count($sintomas)-1) ) $sql.=" UNION ";		
				}
				$sql.=")";
			include 'config.php';
			echo $sql;
			$conteo="";
			$resultado= ($this->conexion) -> query($sql);
			//$result= ($this->conexion) -> query($sql2);
				if (mysqli_num_rows($resultado)>0) {
					//$fila=mysqli_fetch_array($resultado);
						/*while ($num = mysqli_fetch_assoc($resultado)) {
							$salida.=$num['conteo'];
						}*/
						$salida.="<br>";
						while ($fila=mysqli_fetch_assoc($resultado))
						{
							//$salida.= $fila['conteo'];
							//$salida.= "id_sintoma ".$fila['id_sintoma']. " ". " - ";
							$salida.="Cantidad_sintomas -> " .$fila['conteo_total']. " ". " - ";
							$salida.="Conteo ->".$fila['conteo']. " ". " - ";
							$salida.= "Total de la enfermedad =".$fila['total_enfermedad']. " ". " - ";
							$salida.="id_enfermedad -> ".$fila['id_enfermedad']. " ". " - ";
							$salida.="id_sintoma -> ".$fila['id_sintoma']. " ". " <br> ";
							//$salida.=$fila['sintoma_conteo']. " ". " <br> ";
							//$salida.=$fila['conteo'] . " <br><br> "	;
								
														//$salida.= $fila['enfermedad']. "<br><br>";
						}
				}else{
					$salida.="No se encontro ningún resultado";
				}
					
						//$num = mysqli_num_rows($result);
						//echo  $num[0];
			return $salida;


			
				/*}else{
					return "No hay una enfermedad ni una reseta definida por estos sintomas";
				}*/

		}
	}




 ?>
