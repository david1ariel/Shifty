import { FutureShiftModel } from './../../models/future-shift.model';
import { Component } from '@angular/core';
import { FutureShiftsService } from 'src/app/services/future-shifts.service';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-add-future-shift',
  templateUrl: './add-future-shift.component.html',
  styleUrls: ['./add-future-shift.component.css']
})
export class AddFutureShiftComponent {

    public futureShift = new FutureShiftModel();

    constructor(private myFutureShiftsService: FutureShiftsService, private myRouter: Router) { }
  
    public async addFutureShift(){
      try {
          this.futureShift = await this.myFutureShiftsService.addFutureShift(this.futureShift);
          alert("Shift has been added. ID: "+ this.futureShift.shiftId);
          
          this.myRouter.navigateByUrl(environment.futureShiftsBaseUrl);
      } catch (error) {
          console.log(error.message);
      }      
    }

}
