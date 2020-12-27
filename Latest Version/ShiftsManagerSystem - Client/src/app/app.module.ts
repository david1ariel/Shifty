import { JwtInterceptorService } from './services/jwt-interceptor.service';
import { HttpClientModule, HttpInterceptor, HTTP_INTERCEPTORS } from '@angular/common/http';
import { EmployeesService } from './services/employees.service';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {MatTableModule} from '@angular/material/table';

import { AppRoutingModule } from './app-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { LayoutComponent } from './components/layout/layout.component';
import { HomeComponent } from './components/home/home.component';
import { MenuComponent } from './components/menu/menu.component';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { ThumbnailComponent } from './components/thumbnail/thumbnail.component'
import { MatInputModule } from "@angular/material/input";
import { MatButtonModule } from "@angular/material/button";
import { MatCheckboxModule } from "@angular/material/checkbox";
import { MatMenuModule } from "@angular/material/menu";
import { MatIconModule } from "@angular/material/icon";
import { MatSelectModule } from '@angular/material/select';
import { FormsModule } from '@angular/forms';
import { AboutComponent } from './components/about/about.component';
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';
import { EmployeesComponent } from './components/employees/employees.component';
import { AddEmployeeComponent } from './components/add-employee/add-employee.component';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
import { UpdateEmployeeComponent } from './components/update-employee/update-employee.component';
import { AddBusinessComponent } from './components/add-business/add-business.component';
import { ShiftsComponent } from './components/shifts/shifts.component';
import { ShiftTypesComponent } from './components/shift-types/shift-types.component';
import { AddShiftTypeComponent } from './components/add-shift-type/add-shift-type.component';
import { AddShiftComponent } from './components/add-shift/add-shift.component';
import { AddFutureShiftComponent } from './components/add-future-shift/add-future-shift.component';
import { DinamicSquareComponent } from './components/dinamic-square/dinamic-square.component';
import { PairsPipe } from './pipes/pairs.pipe';
import { SubmitShiftsComponent } from './components/submit-shifts/submit-shifts.component';
import { HomePageImageComponent } from './components/home-page-image/home-page-image.component';

@NgModule({
  declarations: [
    LayoutComponent,
    HomeComponent,
    MenuComponent,
    HeaderComponent,
    FooterComponent,
    AboutComponent,
    PageNotFoundComponent,
    EmployeesComponent,
    ThumbnailComponent, 
    AddEmployeeComponent, 
    LoginComponent, 
    LogoutComponent, 
    UpdateEmployeeComponent, 
    AddBusinessComponent, 
    ShiftsComponent, 
    ShiftTypesComponent, 
    AddShiftTypeComponent, 
    AddShiftComponent, 
    AddFutureShiftComponent, 
    DinamicSquareComponent, 
    PairsPipe, SubmitShiftsComponent, HomePageImageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    BrowserAnimationsModule,
    MatInputModule,
    MatButtonModule,
    MatCheckboxModule,
    MatMenuModule,
    MatIconModule,
    MatSelectModule,
    HttpClientModule, //david
    MatTableModule, //david
  ],
  providers: [{
      provide: HTTP_INTERCEPTORS,
      useClass: JwtInterceptorService,
      multi: true
  }],
  bootstrap: [LayoutComponent]
})
export class AppModule { }
