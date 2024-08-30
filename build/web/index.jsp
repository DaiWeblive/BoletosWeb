<%-- 
    Document   : index
    Created on : 13/08/2024, 09:58:59 PM
    Author     : Sebastian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String mensaje=" ";
    if(request.getParameter("error") !=null) {
        switch(request.getParameter("error")) {
            case "1": mensaje="Usuario o contraseña no valida"; break;
            case "2": mensaje="Acceso denegado"; break;
            default: mensaje= "Error desconocido"; break;
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Software de boletos</title>
        <link rel="stylesheet" href="presentacion/estiloInicioSesionCss.css">
    </head>
    <nav id="ejemplo1"> 
        <div class="slider01">
            <div class="slide-track">
                <div class="slide">
                    <img src="presentacion/imganesCss/1.png" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/2.PNG" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/3.png" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/4.PNG" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/5.PNG" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/6.PNG" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/7.png" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/1.png" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/2.PNG" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/3.png" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/4.PNG" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/5.PNG" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/6.PNG" alt="">
                </div>
                <div class="slide">
                    <img src="presentacion/imganesCss/7.png" alt="">
                </div>
            </div>
        </div>
    </nav>
    <nav id="nav02"> 
        <div class="logoTitulo">
            <img class="imagen"src="presentacion/imganesCss/logo.png" alt="">
            <div><h2 id="titulo">Software de Boletos</h2></div>
         </div>
    </nav>
    <body>
        <div class="publicidad">
            <img src="presentacion/imganesCss/publicidad.png.jpg">
        </div>
        <div class="Formulario">
            <h3>Inicio de sesion</h3>
            <form method="post" action="validar.jsp">
                <div class="usuario">
                    <input type="text" name="identificacion" required>
                    <label>Usuario</label>
                </div>
                <div class="usuario">
                    <input type="password" name="clave" required>
                    <label>Contraseña</label>
                </div>
                <div class="recordar">¿olvido su contraseña?</div>
                <p>
                <p id="Error"><%=mensaje%></p>
                <input  type="submit" name="Iniciar" value="Iniciar">
                <div class="registro">
                    Quiero hacer el <a href="#">registro</a>
                </div>
            </form>
        </div>
     </body>
      <footer>
          <div class="info-img">
              <img src="presentacion/imganesCss/redesCss/a.png">@TuBoletaRed
              <img src="presentacion/imganesCss/redesCss/b.png">@TuBoletaRed2024
              <img src="presentacion/imganesCss/redesCss/c.png">@TuBoletaRed
              <img src="presentacion/imganesCss/redesCss/d.png">315 435 4525
          </div>
            <div class="footer-info">
                <p><i class="fas fa-map-marker-alt"></i> Dirección: Calle 18 06 - 24, Pasto, Colombia</p>
                <p><i class="fas fa-phone"></i> Teléfono: +57 311 435 4515</p>
                <p><i class="fas fa-envelope"></i> Email: tuboletared@tuboleta.com</p>
            </div>
    </footer>
</html>
