<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.emergentes.estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    estudiante est = (estudiante) request.getAttribute("est");
    ArrayList<String> seminariosSeleccionados = est.getSeminarios();
%>

<!DOCTYPE html>
<html lang = "es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro en Seminarios</title>
        <style>
            body {
                background-color: #222;
                color: #fff;
                font-family: Arial, sans-serif;
            }

            h1 {
                font-size: 40px;
                text-align: center;
                margin-top: 20px;
            }

            .panel, .panel2 {
                background-color: #2B2B4F;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                width: 400px;
                height: 200px;
                position: absolute;
            }

            .panel {
                top: 90px;
                left: 250px;
            }

            .panel2 {
                top: 90px;
                left: 800px;
            }

            label, input[type="date"], input[type="text"], input[type="radio"], input[type="checkbox"] {
                color: #fff;
                margin-bottom: 10px;
            }

            input[type="date"], input[type="text"], input[type="radio"], input[type="checkbox"] {
                background-color: #444;
                border: 1px solid #555;
                padding: 5px;
                border-radius: 3px;
            }

            input[type="radio"]:checked + label, input[type="checkbox"]:checked + label {
                font-weight: bold;
            }

            button[type="submit"] {
                position: absolute;
                top: 450px;
                left: 600px;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            button[type="submit"]:hover {
                background-color: #0056b3;
            }

            #id, label[for="id"] {
                display: none;
            }

            h4 {
                font-size: 14px;
            }
        </style>
    </head>
    <body>
    <center>
        <h1>REGISTRO DE SEMINARIOS</h1>
    </center>
    <form action="MainServelt" method="post">
        <input type="hidden" name="nr" value="nuevo">
        <div class="panel">
            <label for="id">Id:</label>
            <input type="text" id="id" name="id" value="<%=est.getId()%>" readonly>
            <h4>Datos</h4>
            <label for="fecha">Fecha:  </label>
            <input type="date" id="fecha" name="fecha" value="<%=est.getFecha()%>" required><br>
            <br>
            <label for="nombre">Nombre:  </label>
            <input type="text" id="nombres" name="nombres" value="<%=est.getNombres()%>" required><br>
            <br>
            <label for="apellidos">Apellidos:  </label>
            <input type="text" id="apellidos" name="apellidos" value="<%=est.getApellidos()%>" required><br>
            <br>
            <label>Turno:</label><br>
            <input type="radio" id="mañana" name="turno" value="Mañana" <%= est != null && est.getTurno() != null && est.getTurno().equals("Mañana") ? "checked" : ""%>>
            <label for="mañana">Mañana</label>
            <input type="radio" id="tarde" name="turno" value="Tarde" <%= est != null && est.getTurno() != null && est.getTurno().equals("Tarde") ? "checked" : ""%>>
            <label for="tarde">Tarde</label>
            <input type="radio" id="noche" name="turno" value="Noche" <%= est != null && est.getTurno() != null && est.getTurno().equals("Noche") ? "checked" : ""%>>
            <label for="noche">Noche</label>
        </div>
        <div class="panel2">
            <h4>Seminarios disponibles</h4>
            <input type="checkbox" id="ia" name="seminarios" value="Inteligencia Artificial" <%= seminariosSeleccionados != null && seminariosSeleccionados.contains("Inteligencia Artificial") ? "checked" : ""%>>
            <label for="ia">Inteligencia Artificial</label><br>
            <br>
            <input type="checkbox" id="ml" name="seminarios" value="Machine Learning" <%= seminariosSeleccionados != null && seminariosSeleccionados.contains("Machine Learning") ? "checked" : ""%>>
            <label for="ml">Machine Learning</label><br>
            <br>
            <input type="checkbox" id="sa" name="seminarios" value="Simulacion con Arena" <%= seminariosSeleccionados != null && seminariosSeleccionados.contains("Simulación con Arena") ? "checked" : ""%>>
            <label for="sa">Simulación con Arena</label><br>
            <br>
            <input type="checkbox" id="re" name="seminarios" value="Robotica Educativa" <%= seminariosSeleccionados != null && seminariosSeleccionados.contains("Robótica Educativa") ? "checked" : ""%>>
            <label for="re">Robótica Educativa</label><br>
        </div>
        <button type="submit">ENVIAR</button>
    </form>
</body>
</html>
