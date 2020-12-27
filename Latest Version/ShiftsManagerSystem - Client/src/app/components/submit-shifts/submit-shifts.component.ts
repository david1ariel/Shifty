import { FutureShiftsService } from 'src/app/services/future-shifts.service';
import { ShiftsService } from 'src/app/services/shifts.service';
import { FutureShiftEmployeeModel } from './../../models/future-shift-employee.model';
import { Component, OnInit } from '@angular/core';
import { store } from 'src/app/redux/store';
import { Unsubscribe } from 'redux';

@Component({
    selector: 'app-submit-shifts',
    templateUrl: './submit-shifts.component.html',
    styleUrls: ['./submit-shifts.component.css']
})
export class SubmitShiftsComponent implements OnInit {

    public employee = store.getState().employee;
    public futureShiftsEmployeesById = store.getState().futureShiftsEmployeesById;
    public isAvailable= new Array<boolean>(14);
    public unSubscribe: Unsubscribe;

    constructor(private myFutureShiftsService: FutureShiftsService) { }

    async ngOnInit() {  
        this.unSubscribe = store.subscribe(() => {
            this.futureShiftsEmployeesById = store.getState().futureShiftsEmployeesById;
        })

        if (store.getState().futureShiftsEmployees.length > 0) {
            this.futureShiftsEmployeesById = store.getState().futureShiftsEmployeesById;
        }
        else {

            try {
                await this.myFutureShiftsService.getAllFutureShiftsEMployeesById(this.employee.employeeId);
                console.log("Success");
            }
            catch (err) {
                alert(err.message);
            }
        }

        for(let i= 0;i<14;i++){
            if(this.futureShiftsEmployeesById[i]?.futureShiftId===i){
                this.isAvailable[i]=true;
            }
            else if(this.futureShiftsEmployeesById[i]?.futureShiftId!=i){
                this.isAvailable[i]=false;
                this.futureShiftsEmployeesById.splice(i, 0, new FutureShiftEmployeeModel(i, this.employee.employeeId));
            }
        }
    }

    public markShift(i: number){
        this.isAvailable[i]=!this.isAvailable[i];
    }

    public converBooleanToMark(bool: boolean):string{
        if (bool==true)
            return "✔";
        return "";
    }

    public submitShifts(){
        for(let i=0;i<14;i++){
            if(this.isAvailable[i] === false){
                this.futureShiftsEmployeesById[i].employeeId=0;
            }
            if(this.isAvailable[i]===true){
                this.futureShiftsEmployeesById[i].employeeId=this.employee.employeeId;
            }
        }
        for(let item of this.futureShiftsEmployeesById){
            if(item.employeeId===this.employee.employeeId){
                this.myFutureShiftsService.addFutureShiftEmployee(item);
            }
        }
    }

    public clear(){
        for(let i=0;i<this.isAvailable.length;i++){
            this.isAvailable[i]= false;
        }
        for(let i=0;i<this.futureShiftsEmployeesById.length;i++){
            this.futureShiftsEmployeesById[i].employeeId=0;
        }
    }

}
