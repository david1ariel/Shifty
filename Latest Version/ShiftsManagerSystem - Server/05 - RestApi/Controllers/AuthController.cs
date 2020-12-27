using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CtrlShift
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("EntireWorld")]
    public class AuthController : ControllerBase
    {
        private readonly JwtHelper jwtHelper;
        private readonly EmployeesLogic employeesLogic;

        public AuthController(JwtHelper jwtHelper, EmployeesLogic employeesLogic)
        {
            this.jwtHelper = jwtHelper;
            this.employeesLogic = employeesLogic;
        }


        [HttpPost]
        [Route("register")]
        public IActionResult Register(EmployeeModel employeeModel)
        {
            if (employeesLogic.isUsernameExists(employeeModel.Username))
                return BadRequest("Username already taken");

            employeesLogic.AddEmployee(employeeModel);

            employeeModel.JwtToken = jwtHelper.GetJwtToken(employeeModel.Username, employeeModel.Role);

            return Created("api/employees/" + employeeModel.EmployeeId, employeeModel);
        }

        [HttpPost]
        [Route("login")]
        public IActionResult Login(CredentialsModel credentialsModel)
        {
            EmployeeModel employeeModel = employeesLogic.GetEmployeeByCredentials(credentialsModel);
            if (employeeModel == null)
                return Unauthorized("Incorrect username or password");

            employeeModel.JwtToken = jwtHelper.GetJwtToken(employeeModel.Username, employeeModel.Password);
            return Ok(employeeModel);

        }
    }
}
