package springmvc.controlador;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springmvc.entidades.*;
import springmvc.servicio.*;



@Controller
@RequestMapping("/controlador")
public class Controlador {
	
	@Autowired
	private ServicioEmpleado servicio;

	@GetMapping("/paginaPrincipal")
	public String paginaPrincipal(Model model) {
		
		List<Empleado> empleados = servicio.listarEmpleados();

		model.addAttribute("empleados", empleados);

		return "paginaPrincipal";
	}
	@PostMapping("/salario")
	public String mostrarSalario(@RequestParam("dniEmpleado") String dniEmpleado, Model model) {

		Nomina nomina = servicio.traerSueldo(dniEmpleado);
		
		List<Empleado> empleados = servicio.listarEmpleados();

		model.addAttribute("empleados", empleados);

		for(Empleado empleado:empleados) {
			if(empleado.getDni().equals(dniEmpleado)) {
				 
				model.addAttribute("nombre", nomina.getEmpleado().getNombre());
				model.addAttribute("sueldo", nomina.getSueldo());
				
			} else {
				return "paginaError";
			}
		}
		return "paginaPrincipal";
	}
	@GetMapping("/formulario")
	public String crearUsuario(Model model) {

		Empleado empleado = new Empleado();

		model.addAttribute("empleado", empleado);

		return "formulario";
	}
	
	@GetMapping("/actualizar")
	public String actualizarUsuario(@RequestParam("idEmpleado") int id, Model model) {
		
		Empleado empleado = servicio.traerEmpleado(id);
		
		model.addAttribute("empleado", empleado);
		
		return "formulario";
	}
	
	@PostMapping("/guardarEmpleado")
	public String guardar(@ModelAttribute("empleado") Empleado empleado) {

		int sueldo;

		if (empleado.getNomina().getDni().isEmpty() || empleado.getNomina().getDni() == null) {
			Nomina nomina = new Nomina();

			sueldo = nomina.sueldo(empleado.getCategoria(), empleado.getAntiguedad());

			nomina.setDni(empleado.getDni());
			nomina.setSueldo(sueldo);

			empleado.setNomina(nomina);
			servicio.guardarEmpleado(empleado);

		} else {
			sueldo = empleado.getNomina().sueldo(empleado.getCategoria(), empleado.getAntiguedad());
			empleado.getNomina().setId(empleado.getId());
			empleado.getNomina().setSueldo(sueldo);
			servicio.guardarEmpleado(empleado);
		}

		return "redirect:/controlador/paginaPrincipal";
	}
	
	@GetMapping("/eliminar")
	public String eliminarEmpleado(@RequestParam("empleadoId") int id) {

		servicio.borrarEmpleado(id);

		return "redirect:/controlador/paginaPrincipal";
	}
	
}
