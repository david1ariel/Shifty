import { DisplayShift } from './../models/display-shift.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ShiftModel } from '../models/shift.model';
import { ActionType } from '../redux/action-type';
import { store } from '../redux/store';

@Injectable({
  providedIn: 'root'
})
export class ShiftsService {

    constructor(private http: HttpClient) { }

    public async getAllShifts(): Promise<boolean> {
        try {
            const shifts = await this.http.get<ShiftModel[]>(environment.pastShiftsBaseUrl).toPromise();
            alert("hi")
            store.dispatch({ type: ActionType.GetAllShifts, payload: shifts });
            return true;
        }
        catch (httpErrorResponse) {
            store.dispatch({ type: ActionType.GotError, payload: httpErrorResponse });
            alert("Failed");
            return false;
        }
    }

    public async getAllShiftsToDisplay(): Promise<boolean> {
        try {
            const shiftsToDisplay = await this.http.get<string>(environment.shiftsToDispalyUrl).toPromise();
            store.dispatch({ type: ActionType.GetAllShiftsToDispaly, payload: shiftsToDisplay });
            return true;
        }
        catch (httpErrorResponse) {
            store.dispatch({ type: ActionType.GotError, payload: httpErrorResponse });
            return false;
        }
    }
    
    public addShift(shift: ShiftModel): Promise<ShiftModel> {
        const observable = this.http.post<ShiftModel>(environment.pastShiftsBaseUrl, shift);
        store.dispatch({ type: ActionType.AddShift, payload: shift });
        return observable.toPromise();
    }

    public async getOneShift(id: number): Promise<ShiftModel> {
        const observable = await this.http.get<ShiftModel>(environment.pastShiftsBaseUrl + "/" + id);
        return observable.toPromise();
    }

    public updateShift(shift: ShiftModel): Observable<ShiftModel> {
        const observable = this.http.put<ShiftModel>(environment.pastShiftsBaseUrl + "/" + shift.shiftId, shift);
        store.dispatch({type: ActionType.UpdateShift, payload: shift})
        return observable;
    }

    public deleteShift(id: number): Promise<undefined> {
        const observable = this.http.delete<undefined>(environment.pastShiftsBaseUrl + "/" +id);
        store.dispatch({type: ActionType.DeleteShift, payload: id})
        return observable.toPromise();
    }
}
