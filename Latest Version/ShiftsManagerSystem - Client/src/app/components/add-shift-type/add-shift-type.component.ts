import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ShiftTypeModel } from 'src/app/models/shift-type.model';
import { ShiftTypesService } from 'src/app/services/shift-types.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-add-shift-type',
  templateUrl: './add-shift-type.component.html',
  styleUrls: ['./add-shift-type.component.css']
})
export class AddShiftTypeComponent{

    public shiftType = new ShiftTypeModel();

    constructor(private myShiftTypesService: ShiftTypesService, private myRouter: Router) { }
  
    public async addShiftType(){
      try {
          this.shiftType = await this.myShiftTypesService.addShiftType(this.shiftType);
          alert("Shift type has been added. ID: "+ this.shiftType.shiftTypeId);
          
          this.myRouter.navigateByUrl(environment.shiftTypesBaseUrl);
      } catch (error) {
          console.log(error.message);
      }      
    }

}
