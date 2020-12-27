using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CtrlShift
{
    public class EmployeesLogic : BaseLogic
    {
        public EmployeesLogic(TomediaShiftsManagementContext DB) : base(DB) { }


        public bool isUsernameExists(string username)
        {
            return DB.Employees.Any(e => e.Username == username);
        }

        public List<EmployeeModel> GetAllEmployees()
        {
            return DB.Employees.Select(e => new EmployeeModel(e)).ToList();
        }

        public EmployeeModel GetSingleEmployee(int id)
        {
            return new EmployeeModel(DB.Employees.SingleOrDefault(e => e.EmployeeId == id));
        }

        public EmployeeModel GetEmployeeByCredentials(CredentialsModel credentialsModel)
        {
            return new EmployeeModel(DB.Employees
                .SingleOrDefault(e => e.Username == credentialsModel.Username && e.Password == credentialsModel.Password));
        }

        public EmployeeModel AddEmployee(EmployeeModel employeeModel)
        {
            Employee employee = employeeModel.ConvertToEmployee();
            DB.Employees.Add(employee);
            DB.SaveChanges();
            employeeModel.EmployeeId = employee.EmployeeId;
            return employeeModel;
        }

        public EmployeeModel UptdateFullEmployee(EmployeeModel employeeModel)
        {
            Employee employee = DB.Employees.SingleOrDefault(e => e.EmployeeId == employeeModel.EmployeeId);
            if (employee == null)
                return null;
            employee.LastName = employeeModel.LastName;
            employee.FirstName = employeeModel.FirstName;
            employee.Title = employeeModel.Title;
            employee.BirthDate = employeeModel.BirthDate;
            employee.HireDate = employeeModel.HireDate;
            employee.Adress = employeeModel.Adress;
            employee.PostalCode = employeeModel.PostalCode;
            employee.Phone1 = employeeModel.Phone1;
            employee.Phone2 = employeeModel.Phone2;
            employee.Notes = employeeModel.Notes;
            employee.Photo = employeeModel.Photo;
            employee.PhotoPath = employeeModel.PhotoPath;
            employee.Idcard = employeeModel.Idcard;
            employee.Username = employeeModel.Username;
            employee.Password = employeeModel.Password;
            employee.Role = employeeModel.Role;

            DB.SaveChanges();
            return employeeModel;
        }

        public EmployeeModel UptdatePartialEmployee(EmployeeModel employeeModel)
        {
            Employee employee = DB.Employees.SingleOrDefault(p => p.EmployeeId == employeeModel.EmployeeId);
            if (employee == null)
                return null;

            if (employee.LastName != null)
                employee.LastName = employeeModel.LastName;

            if (employee.FirstName != null)
                employee.FirstName = employeeModel.FirstName;

            if (employee.Title != null)
                employee.Title = employeeModel.Title;

            if (employee.BirthDate != null)
                employee.BirthDate = employeeModel.BirthDate;

            if (employee.HireDate != null)
                employee.HireDate = employeeModel.HireDate;

            if (employee.Adress != null)
                employee.Adress = employeeModel.Adress;

            if (employee.PostalCode != null)
                employee.PostalCode = employeeModel.PostalCode;

            if (employee.Phone1 != null)
                employee.Phone1 = employeeModel.Phone1;

            if (employee.Phone2 != null)
                employee.Phone2 = employeeModel.Phone2;

            if (employee.Notes != null)
                employee.Notes = employeeModel.Notes;

            if (employee.Photo != null)
                employee.Photo = employeeModel.Photo;

            if (employee.PhotoPath != null)
                employee.PhotoPath = employeeModel.PhotoPath;

            if (employee.Idcard != null)
                employee.Idcard = employeeModel.Idcard;

            if (employee.Username != null)
                employee.Username = employeeModel.Username;

            if (employee.Password != null)
                employee.Password = employeeModel.Password;

            if (employee.Role != null)
                employee.Role = employeeModel.Role;

            DB.SaveChanges();
            return employeeModel;
        }

        public void DeleteEmployee(int id)
        {
            Employee employeeToDelete = DB.Employees.SingleOrDefault(p => p.EmployeeId == id);
            if (employeeToDelete == null)
                return;
            DB.Employees.Remove(employeeToDelete);
            DB.SaveChanges();
        }
    }
}
