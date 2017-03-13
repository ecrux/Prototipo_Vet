<?php 
/**
	Este sera mi archivo de clases en php.
	Autor : Edwar Cruz
	Fecha : 06/02/2017
*/
	

	/*
		Mi clase operaciones contiene los objetos 
	*/
	include 'Graficos.php';
	class Operaciones extends Graficos
	{
		public $imagen;
		
		//Contructor de mi clase
		


		//Este método me permitirá colocar títulos, podiendo agregarlos desde el html
		function colocar_titulo($titulo)
		{
			return "<title>". $titulo ."</title>";

		}

		// Este método me permite colocar un nombre y darle una determinación.
		function colocar_nombre($nombre, $complento)
		{
			$salida="<b>".$nombre."</b><br>";
			return $salida . $complento;
		}

		//Este método me permitirá colocar imagenes
		function colocar_imagen($url, $size, $titulo_img, $complememto_img, $id=null)
		{
			$salida="<img id='$id' width='$size' src='$url'>";
			$salida.="<br> <h3><b> $titulo_img </b> </h3";
			$salida.="<br> <h4> $complememto_img </h4>";
			//$this->imagen=$salida;
			return $salida;
		}

		//Esta función me permitira colocar un subtitulo
		function subtitulo()
		{
			return "Hola mundo";
		}

		//Este método permite que obtenga el subtitulo y agragarle el tamaño que desee.
		// Retorna un subtitulo al tamaño que desee
		function agrandar_texto($tam) 
		{
			$salida="<h$tam>". $this->subtitulo() . "</h$tam>"; //agrego el tamaño en las etiquetas <h> y obtengo la función subtitulo.
			return $salida;
		}


		//Este método me permite cambiarle el color a mi subtitulo ya definido, ademas puedo modificar el tamaño.
		// Me retornara subtitulo de un color diferente y tamaño que desee
		function cambiar_color($color,$tam)
		{
			$salida="<div style='color:$color'>" . $this->agrandar_texto($tam)."</div>";
			return $salida;
		}


		//Este método es el estilo de bootstap, son las regillas 'col' a las cuales les puedo definir el tamaño en xs, md y el estilo
		//ademas puedo añadir una imagen definida antes en esta clase
		function col($xs, $md, $url, $size, $titulo_img, $complemento_img, $well)
		{
			$salida="";
			$salida.="<div class='col-xs-$xs col-md-$md";
			if ($well==1) $salida.=" well ' >";
			if ($well==0) $salida.="' >";
			$salida.= $this->colocar_imagen($url, $size, $titulo_img, $complemento_img) . "</div>";
			return $salida;
		}

		//Este método es para añadir un row de bootstrap en mis archivos
		function row($contenido)
		{
			$salida="<div class='row'>";
			$salida.=$contenido;
			$salida.="</div>";
			return $salida;
		}

	}



 ?>
