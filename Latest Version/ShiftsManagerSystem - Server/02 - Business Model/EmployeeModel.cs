using System;
using System.Collections.Generic;
using System.Text;

namespace CtrlShift
{
    public class EmployeeModel
    {
        public int? EmployeeId { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Title { get; set; }
        public DateTime? BirthDate { get; set; }
        public DateTime? HireDate { get; set; }
        public string Adress { get; set; }
        public string PostalCode { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string Notes { get; set; }
        public byte[] Photo { get; set; }
        public string PhotoPath { get; set; }
        public string Idcard { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; } = "user";
        public string JwtToken { get; set; }

        public EmployeeModel() { }

        public EmployeeModel(Employee employee)
        {
            EmployeeId = employee.EmployeeId;
            LastName = employee.LastName;
            FirstName = employee.FirstName;
            Title = employee.Title;
            BirthDate = employee.BirthDate;
            HireDate = employee.HireDate;
            Adress = employee.Adress;
            PostalCode = employee.PostalCode;
            Phone1 = employee.Phone1;
            Phone2 = employee.Phone2;
            Notes = employee.Notes;
            Photo = employee.Photo;
            PhotoPath = employee.PhotoPath;
            Idcard = employee.Idcard;
            Username = employee.Username;
            Password = employee.Password;
            Role = employee.Role;
        }

        public Employee ConvertToEmployee()
        {
            Employee employee = new Employee
            {
                EmployeeId = EmployeeId,
                LastName = LastName,
                FirstName = FirstName,
                Title = Title,
                BirthDate = BirthDate,
                HireDate = HireDate,
                Adress = Adress,
                PostalCode = PostalCode,
                Phone1 = Phone1,
                Phone2 = Phone2,
                Notes = Notes,
                Photo = Photo,
                PhotoPath = PhotoPath,
                Idcard = Idcard,
                Username = Username,
                Password = Password,
                Role = Role,
            };
            return employee;
        }
    }
}
