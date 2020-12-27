import { DisplayShift } from './../../models/display-shift.model';
import { ShiftsService } from 'src/app/services/shifts.service';
import { ShiftModel } from './../../models/shift.model';
import { EmployeeModel } from 'src/app/models/employee.model';
import { Component, OnInit } from '@angular/core';
import { store } from 'src/app/redux/store';
import { Unsubscribe } from 'redux';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

    //public employees: EmployeeModel[];
    public shifts: ShiftModel[];
    public shiftsToDisplay: string;

    public days: string[] = ["Sunday", "Monday", "Tusday", "Wednesday", "Thursday", "Friday", "Saturday"];

    // public makeArray(){
    //     for(let s of this.shifts){
    //         for (let i in s){
    //             this.shifts2.p
    //         }
    //     }
    // }

    
    public unSubscribe: Unsubscribe;
    constructor(private myShiftsService: ShiftsService) { }

    async ngOnInit() {
        this.unSubscribe = store.subscribe(() => {
            this.shiftsToDisplay = store.getState().shiftsToDisplay;
        })

        if (store.getState().shiftsToDisplay.length > 0) {
            this.shiftsToDisplay = store.getState().shiftsToDisplay;
        }
        else {

            try {
                await this.myShiftsService.getAllShiftsToDisplay();
            }
            catch (err) {
                alert(err.message);
            }
        }
    }

    

}
