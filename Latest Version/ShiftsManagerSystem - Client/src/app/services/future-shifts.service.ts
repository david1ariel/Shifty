import { FutureShiftEmployeeModel } from './../models/future-shift-employee.model';
import { ActionType } from './../redux/action-type';
import { FutureShiftModel } from './../models/future-shift.model';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { store } from '../redux/store';

@Injectable({
  providedIn: 'root'
})
export class FutureShiftsService {

    constructor(private http: HttpClient) { }

    public async getAllFutureShifts(): Promise<boolean> {
        try {
            const futureshifts = await this.http.get<FutureShiftModel[]>(environment.futureShiftsBaseUrl).toPromise();
            store.dispatch({ type: ActionType.GetAllFutureShifts, payload: futureshifts });
            return true;
        }
        catch (httpErrorResponse) {
            store.dispatch({ type: ActionType.GotError, payload: httpErrorResponse });
            return false;
        }
    }

    public async getAllFutureShiftsEMployees(): Promise<boolean> {
        try {
            const futureShiftsEmployees = await this.http.get<FutureShiftEmployeeModel[]>(environment.futureShiftsEmployeeBaseUrl).toPromise();    
            store.dispatch({ type: ActionType.GetAllFutureShiftsEmployees, payload: futureShiftsEmployees });
            return true;
        } 
        catch (httpErrorResponse) {
            store.dispatch({ type: ActionType.GotError, payload: httpErrorResponse });
            return false;
        }
    }

    public async getAllFutureShiftsEMployeesById(id: number): Promise<boolean> {
        try {
            const futureShiftsEmployeesById = await this.http.get<FutureShiftEmployeeModel[]>(environment.futureShiftsEmployeeBaseUrl+"/"+id).toPromise();    
            store.dispatch({ type: ActionType.GetAllFutureShiftsEmployeesById, payload: futureShiftsEmployeesById });
            return true;
        } 
        catch (httpErrorResponse) {
            store.dispatch({ type: ActionType.GotError, payload: httpErrorResponse });
            return false;
        }
    }

    public addFutureShiftEmployee(futureShiftEmployeeModel: FutureShiftEmployeeModel){
        const observable = this.http.post<FutureShiftEmployeeModel>(environment.futureShiftsEmployeeBaseUrl, futureShiftEmployeeModel);
        store.dispatch({type: ActionType.AddFutureShiftEmployee, payload: futureShiftEmployeeModel});
        return observable.toPromise();
    }
    
    public addFutureShift(futureshift: FutureShiftModel): Promise<FutureShiftModel> {
        const observable = this.http.post<FutureShiftModel>(environment.futureShiftsBaseUrl, futureshift);
        store.dispatch({type: ActionType.AddFutureShift, payload: futureshift})
        return observable.toPromise();
    }

    public async getOneFutureShift(id: number): Promise<FutureShiftModel> {
        const observable = await this.http.get<FutureShiftModel>(environment.futureShiftsBaseUrl + "/" + id);
        return observable.toPromise();
    }

    public updateFutureShift(futureshift: FutureShiftModel): Observable<FutureShiftModel> {
        const observable = this.http.put<FutureShiftModel>(environment.futureShiftsBaseUrl + "/" + futureshift.shiftId, futureshift);
        store.dispatch({type: ActionType.UpdateFutureShift, payload: futureshift})
        return observable;
    }

    public deleteFutureShift(id: number): Promise<undefined> {
        const observable = this.http.delete<undefined>(environment.futureShiftsBaseUrl + "/" +id);
        store.dispatch({type: ActionType.DeleteFutureShift, payload: id})
        return observable.toPromise();
    }
}
