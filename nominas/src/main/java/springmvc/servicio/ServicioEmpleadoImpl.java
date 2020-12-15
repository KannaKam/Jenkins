package springmvc.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springmvc.entidades.*;
import springmvc.repositorio.EmpleadoRepositorio;

import java.util.List;
import java.util.Optional;

@Service
public class ServicioEmpleadoImpl implements ServicioEmpleado{

	@Autowired
	private EmpleadoRepositorio repositorio;

	@Override
	@Transactional
	public Empleado traerEmpleado(int id) {
		Optional <Empleado> empleadoOp = repositorio.findById(id);
		
		Empleado empleado = empleadoOp.get();
		return empleado;
	}

	@Override
	@Transactional
	public Nomina traerSueldo(String dni) {
		
		return repositorio.getNomina(dni);
	}

	@Override
	@Transactional
	public List<Empleado> listarEmpleados() {
		
		return repositorio.findAll();
	}

	@Override
	@Transactional
	public void guardarEmpleado(Empleado empleado) {
		
		repositorio.save(empleado);
		
	}

	@Override
	@Transactional
	public void borrarEmpleado(int id) {
		
		repositorio.deleteById(id);
		
	}
	
	
}
