<%@page import="com.emergentes.estudiante"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("listaper") == null) {
        ArrayList<estudiante> lista = new ArrayList<>();
        session.setAttribute("listaper", lista);
    }
    ArrayList<estudiante> lista = (ArrayList<estudiante>) session.getAttribute("listaper");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTROS DE SEMINARIOS</title>
    </head>
    <body>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #222;
                color: #fff;
                margin: 0;
                padding: 0;
            }

            h1 {
                color: #fff;
                text-align: center;
            }

            form {
                width: 50%;
                margin: 0 auto;
                padding: 20px;
                background-color: #333;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            }

            table {
                width: 100%;
                margin-bottom: 20px;
                border-collapse: collapse;
            }

            table th,
            table td {
                padding: 10px;
                border: 1px solid #555;
                text-align: left;
            }

            table th {
                background-color: #444;
                color: #fff;
            }

            input[type="text"],
            input[type="date"] {
                width: calc(100% - 20px);
                padding: 5px;
                margin-bottom: 10px;
                border: 1px solid #555;
                background-color: #444;
                color: #fff;
            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                border: none;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                border-radius: 5px;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            input[type="hidden"] {
                display: none;
            }
        </style>
    <center>
        <h1>REGISTRO DE SEMINARIOS</h1>
    </center>
    <form action="MainServelt" method="get">
        <input type="hidden" name="op" value="nuevo">
        <button type="submit">Nuevo</button>
    </form>
    <br>
    <table border="1" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Fecha</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Turno</th>
                <th>Seminarios</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <%
                if (lista != null) {
                    for (estudiante item : lista) {
            %>
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getFecha()%></td>
                <td><%=item.getNombres()%></td>
                <td><%=item.getApellidos()%></td> 
                <td><%=item.getTurno()%></td>
                <td><%=item.getSeminarios()%></td>
                <td><a href="MainServelt?op=editar&id=<%= item.getId()%>">Editar</a></td>
                <td><a href="MainServelt?op=eliminar&id=<%= item.getId()%>" onclick="return confirm('¿Está seguro de eliminar?')">Eliminar</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>