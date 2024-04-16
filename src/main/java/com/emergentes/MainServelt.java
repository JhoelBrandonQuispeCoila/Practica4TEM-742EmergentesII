package com.emergentes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServelt", urlPatterns = {"/MainServelt"})
public class MainServelt extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        estudiante objest = new estudiante();
        int id, pos;
        HttpSession ses = request.getSession();
        ArrayList<estudiante> lista = (ArrayList<estudiante>) ses.getAttribute("listaper");

        switch (op) {
            case "nuevo":
                request.setAttribute("est", objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(lista, id);
                if (pos >= 0 && pos < lista.size()) {
                    objest = lista.get(pos);
                    request.setAttribute("est", objest);
                    request.getRequestDispatcher("editar.jsp").forward(request, response);
                }
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(lista, id);
                if (pos >= 0 && pos < lista.size()) {
                    lista.remove(pos);
                }
                response.sendRedirect("index.jsp");
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        ArrayList<estudiante> lista = (ArrayList<estudiante>) ses.getAttribute("listaper");

        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String turno = request.getParameter("turno");
        String[] seminariosSeleccionados = request.getParameterValues("seminarios");

        estudiante objest = new estudiante();
        objest.setId(id);
        objest.setFecha(fecha);
        objest.setNombres(nombres);
        objest.setApellidos(apellidos);
        objest.setTurno(turno);
        if (seminariosSeleccionados != null) {
            objest.setSeminarios(new ArrayList<>(Arrays.asList(seminariosSeleccionados)));
        }
        if (id == 0) {
            int newId = obtenerNuevoId(lista);
            objest.setId(newId);
            lista.add(objest);
        } else {
            int pos = buscarPorIndice(lista, id);
            if (pos >= 0 && pos < lista.size()) {
                lista.set(pos, objest);
            }
        }

        ses.setAttribute("listaper", lista);
        response.sendRedirect("index.jsp?success=true");
    }

    public int buscarPorIndice(ArrayList<estudiante> lista, int id) {
        int pos = -1;
        if (lista != null) {
            for (int i = 0; i < lista.size(); i++) {
                if (lista.get(i).getId() == id) {
                    pos = i;
                    break;
                }
            }
        }
        return pos;
    }

    public int obtenerNuevoId(ArrayList<estudiante> lista) {
        int newId = 1;
        for (estudiante ele : lista) {
            if (ele.getId() >= newId) {
                newId = ele.getId() + 1;
            }
        }
        return newId;
    }

}
