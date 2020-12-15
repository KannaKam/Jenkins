package springmvc.servicio;

import java.util.List;

import springmvc.entidades.*;

public interface ServicioEmpleado {

	public Empleado traerEmpleado(int id);
	public Nomina traerSueldo(String dni);
	public List<Empleado> listarEmpleados();
	public void guardarEmpleado(Empleado empleado);
	public void borrarEmpleado(int id);
	
}
