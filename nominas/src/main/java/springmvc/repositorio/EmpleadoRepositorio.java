package springmvc.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springmvc.entidades.*;

public interface EmpleadoRepositorio extends JpaRepository<Empleado, Integer>{
	
	@Query("FROM nomina WHERE idEmpleado = ?1")
	public Nomina getNomina(String dniEmpleado);
	
}
