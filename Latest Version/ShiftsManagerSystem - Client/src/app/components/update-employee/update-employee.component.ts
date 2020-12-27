import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { EmployeeModel } from 'src/app/models/employee.model';
import { EmployeesService } from 'src/app/services/employees.service';

@Component({
  selector: 'app-update-employee',
  templateUrl: './update-employee.component.html',
  styleUrls: ['./update-employee.component.css']
})
export class UpdateEmployeeComponent implements OnInit {

    public employee: EmployeeModel;

    constructor(private myActivatedRoute: ActivatedRoute,
        private myEmployeesService: EmployeesService, private myRouter: Router) { }

    async ngOnInit() {
        try {
            const id = +this.myActivatedRoute.snapshot.params.employeeId;
            this.employee = await this.myEmployeesService.getOneEmployee(id);
        }
        catch (err) {
            alert(err.message);
        }
    }

    public updateEmployee() {
        const observable = this.myEmployeesService.updateEmployee(this.employee);
        observable.subscribe(
            updatedEmployee => { 
                alert("Employee has been updated. ID: " + updatedEmployee.employeeId);
                this.myRouter.navigateByUrl("/Employees")
            },
            err => alert(err.message)
        );
    }

}
