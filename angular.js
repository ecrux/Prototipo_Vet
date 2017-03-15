/**
* Autor : Edwar Cruz
* Fecha : 01/03/2017
* Este es mi archivo angula aqui tendre mi funciones angular para aplicarlas a mi proyecto 
*/

var acumuladorApp = angular.module( 'App', [] );
        
        acumuladorApp.controller( "App-Ctrl",
            
            //[ "$scope",  //Originalmente solo se minificaba el scope.
            [ "$scope", "$http", //Esto es para minificar, pero interfiere con lo de php, hay que minificar las otras variables.
             
                function( $scope, $http )
                {
            
                    $scope.verificar = function(a)
                    {
                         var lista = document.getElementById( "select" );
                            var contenedor_salida = document.getElementById( "contenedor-salida" );
                            var salida = "";
                            var retornar="";
                            var conteo = 0;

                            console.log( "Total de elementos de la lista: " + lista.length );

                            for( var i = 0; i < lista.length; i ++ )
                            {
                                //console.log( lista.item( 2 ).value );

                                if( lista.item( i ).selected )
                                {
                                    if (salida == "") 
                                    {
                                        salida += lista.item( i ).value;
                                    }else{
                                        salida += ","+lista.item( i ).value;
                                    }
                                    
                                    conteo ++;
                                }
                            }   
                                   
                                    //console.log(salida);
                            $scope.sintoma=salida;
                            //cargar_datos_php(salida);
                            if( salida.length != "" )
                            {
                                //Aquí se hace el llamado a un php con conexión a MySQL.
                               $http.get("traer_resultados.php?cadena=" + salida )
                               .then(function (response) {$scope.campos = response.data.records;}
                                );
                                

                                /*$http.get( 'traer_resultados.php?cadena=' + salida ).success
                                (
                                    function( response ) 
                                    { 
                                        console.log( 'response' );
                                        $scope.campos = response.records;            
                                    }
                                ); */  
                            }                    
                               
                    }

                }
            ] //Si se minifica, se deben minificar todas las llamadas inyecciones, de lo contrario mejor no minifique nada.
        );
