using System;
using System.Collections.Generic;

namespace CtrlShift
{
    public partial class Employee
    {
        public Employee()
        {
            FutureShifts = new HashSet<FutureShift>();
            PastShifts = new HashSet<PastShift>();
        }

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
        public string Role { get; set; }

        public virtual ICollection<FutureShift> FutureShifts { get; set; }
        public virtual ICollection<PastShift> PastShifts { get; set; }
    }
}
