  
 print "\n";
print "************************************************************************\n";
print "\n";
print "W  W  W	EEEEEE	BBBB  	    2222  \n";
print "W  W  W	EEE   	BB  BB	   22  22 \n";
print " WW WW 	EEEEEE	BBBB  	      22  \n";
print " WW WW 	EEE   	BB  BB	    22    \n";
print " W  W  	EEEEEE	BBBB  	   222222 \n";
print "\n";
print "\n";
print "EEEEEE	VV  VV	EEEEEE	NN  NN	TTTTTT	UU  UU	SSSSSS \n";
print "EEE   	VV  VV	EEE   	NNN NN	  TT  	UU  UU	SSS    \n";
print "EEEEEE	 VVVV 	EEEEEE	NNNNNN	  TT  	UU  UU	SSSSSS \n";
print "EEE   	 VVVV 	EEE   	NN NNN	  TT  	UUUUUU	   SSS \n";
print "EEEEEE	  VV   	EEEEEE	NN  NN	  TT  	 UUUU 	SSSSSS \n";
print "\n";
print "************************************************************************\n";
print "\n";

# Press enter
print "\n\n";
print "Press Enter to continue... \n";
print "Teclea Enter para continuar... \n";
$reply = <STDIN>;

print "ENGLISH: \n";
print "Welcome to Web2Eventus, v2.0\n";
print "\n";
print "Copyright (C) 2014, Javier Osorio and Alejandro Reyes. \n";
print "\n";
print "Web2Eventus is free software: you can redistribute it and/or modify it under\n";
print "the terms of the GNU General Public License as published by the Free Software\n";
print "Foundation, either version 3 of the License, or any later version.\n";
print "\n";
print "This program is distributed in the hope that it will be useful, but WITHOUT\n";
print "ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS\n";
print "FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.\n";
print "\n";
print "How to cite this program:\n";
print "Javier Osorio and Alejandro Reyes. 2014. Web2Eventus. Version 2.0.\n";
print "\n";
print "\n";

print "\n";
print "************************************\n";
print "\n";

print "ESPANOL:\n";
print "Bienvenido a Web2Eventus, v2.0\n";
print "\n";
print "Copyright (C) 2014, Javier Osorio and Alejandro Reyes \n";
print "\n";
print "Web2Eventus es software libre: usted puede distribuirlo y/o modificarlo bajo\n";
print "los terminos de la Licencia Publica General GNU como esta publicada por el\n";
print "Free Software Foundation, ya sea en la version 3 de la Licencia, o cualquier\n";
print "version posterior. \n"; 
print "\n";
print "Este programa es distribuido con la esperanza que le sea util, pero NO TIENE\n";
print "NINGUNA GARANTIA; ni siquiera la garantia implicita de COMERCIABILIDAD o \n";
print "CONVENIENCIA PARA UN PROPOSITO PARTICULAR. Para mayores detalles, ver la \n";
print "Licencia Publica General GNU. \n";
print "\n";
print "Como citar este programa:\n";
print "Javier Osorio y Alejandro Reyes. 2014. Web2Eventus. Version 2.0.\n";
print "\n";
print "\n";

print "\n";
print "************************************\n";
print "\n";

# Press enter
print "\n\n";
print "Press Enter to continue... \n";
print "Teclea Enter para continuar... \n";
$reply = <STDIN>;


#abro el archivo que transformo de pdf a txt
#y lo dejo ordenado por p\uFFFDrrafos
#cada linea es un parrafo.

use Encode qw/encode decode/;

print "************************************\n";
print "###### ENG: Enter the route containing the files to be processed.\n";
print "######      Examples:\n";
print "######      Absolute route: C:/directory/web/*.html\n";
print "######      Relative route: web/*.html\n\n";
print "###### ESP: Teclea la ruta qur contiene los archivos a procesar.\n";
print "######      Ejemplos:\n";
print "######      Ruta absoluta: C:/directorio/web/*.html\n";
print "######      Ruta relativa: web/*.html\n";
print "************************************\n";
my $entrada = <STDIN>;
#print $entrada;

	#@archivos = glob $ARGV[0];
	@archivos = glob $entrada;
	
print "************************************\n";
print "\n###### ENG: The selected directory contains ".$#archivos." files \n";
print "\n###### ESP: El directorio seleccionado tiene ".$#archivos." archivos \n\n";
print "************************************\n";

print "************************************\n";
print "###### ENG: Enter the name of the file (.txt) to contain the corpus of text\n";	
print "######      extracted from the processed files. If there is a file \n";
print "######      with that name, it will be replaced with the new content.\n";
print "###### ESP: Teclea el nombre del archivo (.txt) que contendra el corpus de \n";	
print "######      texto extraido de los archivos procesados. Si ya existe un archivo\n";
print "######      con ese nombre, este sera reemplazado con el nuevo contenido.\n";
print "************************************\n";

my $salida = <STDIN>;
#print $salida;

	#open (DEST,">$ARGV[0]") || die "No se pudo abrir el archivo: ".$ARGV[1];
	open (DEST,">$salida") || die "No se pudo abrir el archivo: ".$salida;
#	open (DEST_LUG,">$ARGV[1].lug") || die "No se pudo abrir el archivo: ".$ARGV[1].".lug";
	
	#open (FILE,"<".$ARGV[0]) || die "No se pudo abrir el archivo".$ARGV[0];
	
	my $linea="";
	my $parrafo="";
	$num_parrafo=0;	$num_parrafo2=0;

	foreach $archivo(@archivos){
		print $archivo."\n";
	
		open (FILE,"<".$archivo) || die "No se pudo abrir el archivo: ".$archivo;
	
		@nom = split(/\//,$archivo);
		$nombre = $nom[$#nom];
		#print $nombre."\n";
		$nombre =~ s/\.html//;			#obtengo el nombre sin .txt ni ruta
		$nombre =~ s/\.txt//;			#obtengo el nombre sin .txt ni ruta
		$fecha = substr($nombre,0,8);	#imprimo la fecha en formato de 8 digitos
		#$num_parrafo=0;
	
		$anterior=0;
		$parrafo="";

		#recorro el archivo
		while ($linea=<FILE>){		
			chop($linea); #chop($linea);	
			
			$parrafo=$parrafo." ".$linea;		

		} #fin while FILE
		#print DEST $parrafo."\n";
	# ATTENTION. EDIT THESE LINES TO PROCESS DIFFERENT TYPES OF WEBSIES
		# LOOK FOR THE BEGINING OF THE BODY OF TEXT IN THE CODE
		# Use format $mystring=~s/Anne/Jim/ig to substitute "Jim" for "Anne", insensitive global  
	$parrafo =~ s/<BODY(.*?)>/<BODY>/ig;   		
    $parrafo =~ s/<BODY>(.*?)<\/BODY/$1/ig;    
    $parrafo = $1;
    #print DEST $parrafo."\n";
    $parrafo =~ s/<IMG(.*?)>/__/ig;
    $parrafo =~ s/<A(.*?)<\/A>/__/ig;
    
    $parrafo =~ s/<STYLE(.*?)<\/STYLE>/__/ig;
    $parrafo =~ s/<SCRIPT(.*?)<\/SCRIPT>/__/ig;
    
    $parrafo =~ s/<NAV(.*?)<\/NAV>/__/ig;
    $parrafo =~ s/<TABLE(.*?)>/__/ig;
    $parrafo =~ s/<TR(.*?)>/__/ig;
    $parrafo =~ s/<TD(.*?)>/__/ig;
    $parrafo =~ s/<\/TABLE>/__/ig;
    $parrafo =~ s/<\/TR>/__/ig;
    $parrafo =~ s/<\/TD>/__/ig;
    
    $parrafo =~ s/<TBODY(.*?)>/__/ig;
    $parrafo =~ s/<\/TBODY>/__/ig;

    $parrafo =~ s/\\par//ig;
    $parrafo =~ s/<b>/ /ig;
    $parrafo =~ s/<i>/ /ig;
    $parrafo =~ s/<\/b>/ /ig;
    $parrafo =~ s/<\/i>/ /ig;
	
	#$parrafo =~ s/<\/SPAN><BR><SPAN/__/ig;
	#$parrafo =~ s/class=txt_general>/__/ig;

    #$parrafo =~ s/<SPAN(.*)<SPAN(.*?)<\/SPAN>(.*?)<\/SPAN>/__/ig;
    #$aux1 =~ s/<SPAN(.*?)<\/SPAN>/__/ig;  ##Puede que esta linea quite informacion relevante entre spans
        																					##La etiqueta span puede contener informacion
    #print DEST $parrafo."\n";
    $entra = 1;
    while($entra == 1){
    	$aux1 = $parrafo;
    	$aux1 =~ s/<SPAN(.*?)<\/SPAN>/__/i;
    	
    	#print $1 . "\n";
    	if ($1 =~ /<SPAN/){
    		$parrafo =~ s/<SPAN(.*?)<SPAN(.*?)<\/SPAN>(.*?)<\/SPAN>/__/i;
    		#print "multiple\n";
    		#print $parrafo."\n";
    	}else{
    		if (length($1) < 20){
    			$parrafo =~ s/<SPAN(.*?)<\/SPAN>/__/i;
    		}else{
    			$parrafo =~ s/<SPAN(.*?)>/__/i;
    			$parrafo =~ s/<\/SPAN>/__/i;
    		}
    	}
    	
    	if ($parrafo !~ /<SPAN/){
    		$entra = 0;
    	}
    }
    #print $1 . "\n";
    
    #$parrafo =~ s/<\/SPAN>/__/ig;
	
    $parrafo =~ s/<\/A>/__/ig;
    $parrafo =~ s/<!--(.*?)-->/__/ig;
    $parrafo =~ s/<STRONG(.*?)>/__/ig;
    $parrafo =~ s/<\/STRONG>/__/ig;
    $parrafo =~ s/<\/DIV>/__/ig;
    #$parrafo =~ s/<SELECT(.*?)>/__/ig;
    $parrafo =~ s/<SELECT(.*?)<\/SELECT>/__/ig;
    $parrafo =~ s/<OPTION(.*?)>/__/ig;
    $parrafo =~ s/<FOOTER(.*?)<\/FOOTER>/__/ig;
    $parrafo =~ s/<HEADER(.*?)>/__/ig;
    $parrafo =~ s/<FORM(.*?)>/__/ig;
    $parrafo =~ s/<INPUT(.*?)>/__/ig;
    $parrafo =~ s/<\/FORM>/__/ig;
    $parrafo =~ s/<\/HEADER>/__/ig;
    $parrafo =~ s/<\\par>/__/ig;
    $parrafo =~ s/<BR>-&nbsp;/__/ig;
	$parrafo =~ s/&nbsp;/__/ig;
	$parrafo =~ s/-&nbsp;&nbsp;/__/ig;
	#$parrafo =~ s/<\/SPAN><BR><SPAN class=txt_general>-&nbsp;&nbsp;/SSALTOO/ig;
	
    $parrafo =~ s/\\u133\?/__/ig;
    $parrafo =~ s/\\bullet/__/ig;
    
	$parrafo =~ s/__<BR>__/SSALTOO/ig;
    $parrafo =~ s/<P>([\w|\W|\s]{1,10})<\/P>/__/ig;
    $parrafo =~ s/__([\w|\W|\s]{1,15})__/__/ig;
    $parrafo =~ s/__([\w|\W|\s]{1,15})__/__/ig;
    $parrafo =~ s/__([\w|\W|\s]{1,15})__/__/ig;
    $parrafo =~ s/__([\w|\W|\s]{1,15})__/__/ig;
    $parrafo =~ s/__([\w|\W|\s]{1,15})__/__/ig;
    $parrafo =~ s/__([\w|\W|\s]{1,15})__/__/ig;
	
    $parrafo =~ s/<DIV(.*?)>/SSALTOO/ig;
    $parrafo =~ s/<P(.*?)>/SSALTOO/ig;
    $parrafo =~ s/<BR>/SSALTOO/ig;
    $parrafo =~ s/<(.*?)>/__/ig;
    
    #print DEST $parrafo ."\n";
    $num_parrafo = 0;
    @partes = split(/SSALTOO/,$parrafo);
    foreach $parte(@partes){
    	#print DEST $fecha."\t$nombre"."_P | ".$parte."\n";
    	if (length($parte)>13){
    		
			# Todo este codigo es para eliminar basura de archivos en .html
			$parte =~ s/\\\'bfquien;/quien/gi;
			$parte =~ s/\\\'bf;//gi;
			$parte =~ s/\\\'bf/ /gi;			
			$parte =~ s/<P>\'bf/ /gi;
			#$parte =~ s/ , \\\'bfa;/, a/gi;
			$parte =~ s/,/ , /gi;
			$parte =~ s/\\\'bfa;/a/gi;
			$parte =~ s/\\\'bf;/ /gi;
			$parte =~ s/bf;/ /gi;
			$parte =~ s/\\u147 ;/ /gi;
			$parte =~ s/\\u147;/ /gi;
			$parte =~ s/\\u147/ /gi;
			$parte =~ s/\\u148/ /gi;
			$parte =~ s/\\u151/ /gi;
			$parte =~ s/\\u149/ /gi;
			$parte =~ s/\\u150/ /gi;
			$parte =~ s/\\bullet/ /gi;
			$parte =~ s/\\\'a1/ /gi;		
			$parte =~ s/\\\'b7/ /gi;		
			$parte =~ s/\\\'a2//gi;
			$parte =~ s/\\\'e2//gi;
			$parte =~ s/\\u128//gi;
			$parte =~ s/\\\'fc/u/gi;
			$parte =~ s/\./ . /gi;			
			$parte =~ s/u147;//gi;
			$parte =~ s/\\u148 \;//gi;
			$parte =~ s/\\u148//gi;
			$parte =~ s/u148;//gi;
			$parte =~ s/\\\'a1;//gi;			
			$parte =~ s/\\\'e2\\u128;//gi;
			$parte =~ s/\\u128;//gi;
			$parte =~ s/\\\'a2;//gi;
			$parte =~ s/\\\'e2;//gi;
			$parte =~ s/\'!\';/ /gi;
			$parte =~ s/!;/ /gi;
			$parte =~ s/\:/ : /gi;
			$parte =~ s/\_/ /gi;
			$parte =~ s/\-/ /gi;
			$parte =~ s/\\par//gi;
			$parte =~ s/\\pa//gi;
			$parte =~ s/\'\>\'\;/ /gi;
			$parte =~ s/[>];/ /gi;
			$parte =~ s/\\\'b7;//gi;
			$parte =~ s/\'b7;//gi;
			$parte =~ s/\\\'ab//gi;
			$parte =~ s/\\\'ba//gi;
			$parte =~ s/\\\'bb//gi;
			$parte =~ s/\\\'d4//gi;		
			$parte =~ s/\\f1//gi;
			$parte =~ s/\\rtlch//gi;
			$parte =~ s/\\\'fe//gi;
			$parte =~ s/\\f0//gi;
			$parte =~ s/\\ltrch//gi;			
			# vocales con acento
			$parte =~ s/&aacute;/a/gi;
			$parte =~ s/&eacute;/e/gi;
			$parte =~ s/&iacute;/i/gi;
			$parte =~ s/&oacute;/o/gi;
			$parte =~ s/&uacute;/u/gi;
			$parte =~ s/&ntilde;/nn/gi;
			$parte =~ s/\\\'e1/a/gi;
			$parte =~ s/\\\'c1/A/gi;
			$parte =~ s/\\\'e9/e/gi;
			$parte =~ s/\\\'c9/E/gi;
			$parte =~ s/\\\'ed/i/gi;
			$parte =~ s/\\\'ea/i/gi;
			$parte =~ s/\\'cd/I/gi;
			$parte =~ s/\\'f3/o/gi;
			$parte =~ s/\\'d3/O/gi;
			$parte =~ s/\\'fa/u/gi;
			$parte =~ s/\\'da/U/gi;
			$parte =~ s/\\\'f1/nn/gi;
			# comillas
			$parte =~ s/\\emdash/ /gi;
			$parte =~ s/\\ldblquote/ /gi;
			$parte =~ s/\\rdblquote/ /gi;
			$parte =~ s/\\lquote/ /gi;
			$parte =~ s/\\rquote/ /gi;
			$parte =~ s/&quot;/ /gi;			
			$parte =~ s/\"/ /gi;
			$parte =~ s/\?/ /gi;
			$parte =~ s/\\\}/ /gi;
			$parte =~ s/\\'/ /gi;
			$parte =~ s/\'/ /gi;
			$parte =~ s/&gt;/ /gi;
			$parte =~ s/&nbsp;/ /gi;
			$parte =~ s/&#8211;//gi;
			$parte =~ s/&#8220;//gi;
			$parte =~ s/&#8221;//gi;
			$parte =~ s/&#8226;//gi;

			$parte =~ s/:::/ /gi;
			$parte =~ s/<!\[CDATA\[/ /gi;
			$parte =~ s/\@import \"\/img\/css\/estilo\.css\";/ /gi; 
			$parte =~ s/-->/ /gi;
			$parte =~ s/\&copy;/ /gi;
			$parte =~ s/                   / /gi;
			$parte =~ s/                  / /gi;
			$parte =~ s/                 / /gi;
			$parte =~ s/                / /gi;
			$parte =~ s/               / /gi;
			$parte =~ s/              / /gi;
			$parte =~ s/             / /gi;
			$parte =~ s/            / /gi;
			$parte =~ s/           / /gi;
			$parte =~ s/          / /gi;
			$parte =~ s/         / /gi;
			$parte =~ s/        / /gi;
			$parte =~ s/       / /gi;
			$parte =~ s/      / /gi;
			$parte =~ s/     / /gi;
			$parte =~ s/    / /gi;
			$parte =~ s/   / /gi;
			$parte =~ s/  / /gi;
			$parte =~ s/<br>/\\par/gi;
			$parte =~ s/<BR>/\\par/gi;
			$parte =~ s/<P>/\\par/gi;
			$parte =~ s/<p>/\\par/gi;
			$parte =~ s/<p>\'bf/\\par /gi;
			$parte =~ s/<\/O:P>/\\par/gi;
			$parte =~ s/\\par/<\\par>/gi;
			
    		
    		@totPalabras = split(/ /,$parte);
    		if ($#totPalabras >= 2){
    			
    			$parte =~ s/^\s+//;
    			
    			print DEST $fecha."\t$nombre"."_P".$num_parrafo."_P".$num_parrafo2." | ".$parte."\n";
    			$num_parrafo++;
    			$num_parrafo2++;
    		}
    	}	
    }
		 
		

	} #fin for each