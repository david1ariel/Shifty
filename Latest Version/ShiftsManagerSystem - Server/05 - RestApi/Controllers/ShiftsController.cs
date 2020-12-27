using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CtrlShift.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("EntireWorld")]
    public class ShiftsController : ControllerBase
    {
        private readonly ShiftsLogic logic;

        public ShiftsController(ShiftsLogic logic)
        {
            this.logic = logic;
        }

        [HttpGet]
        [Route("past_shifts")]
        public IActionResult GetAllPastShifts()
        {
            try
            {
                List<PastShiftModel> pastShifts = logic.GetAllPastShifts();
                return Ok(pastShifts);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet]
        [Route("shifts_to_display")]
        public IActionResult GetAllShiftsToDispaly()
        {
            try
            {
                List<List<PastShiftModel>> shiftsToDisplay = DataHandler.makeShifts2DList();
                return Ok(shiftsToDisplay);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet]
        [Route("past_shifts/{id}")]
        public IActionResult GetSinglePastShift(int id)
        {
            try
            {
                PastShiftModel pastShift = logic.GetSinglePastShift(id);
                if (pastShift == null)
                    return NotFound($"id {id} not found");
                return Ok(pastShift);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPost]
        [Route("past_shifts")]
        public IActionResult AddPastShift(PastShiftModel pastShiftModel)
        {
            try
            {
                PastShiftModel addedPastShift = logic.AddPastShiftModel(pastShiftModel);
                return Created("api/shifts/past_shifts/" + addedPastShift.ShiftId, addedPastShift);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPut]
        [Route("past_shifts/{id}")]
        public IActionResult UpdateFullPastShift(int id, PastShiftModel pastShiftModel)
        {
            try
            {
                pastShiftModel.ShiftId = id;
                PastShiftModel updatedPastShift = logic.UptdateFullPastShift(pastShiftModel);
                if (updatedPastShift == null)
                    return NotFound($"id {id} not found");
                return Ok(updatedPastShift);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPatch]
        [Route("past_shifts/{id}")]
        public IActionResult UpdatePartialPastShift(int id, PastShiftModel pastShiftModel)
        {
            try
            {
                pastShiftModel.ShiftId = id;
                PastShiftModel updatedPastShift = logic.UptdatePartialPastShift(pastShiftModel);
                if (updatedPastShift == null)
                    return NotFound($"id {id} not found");
                return Ok(updatedPastShift);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpDelete]
        [Route("past_shifts/{id}")]
        public IActionResult DeletePastShift(int id)
        {
            try
            {
                logic.DeletePastShift(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }




        [HttpGet]
        [Route("future_shifts")]
        public IActionResult GetAllFutureShifts()
        {
            try
            {
                List<FutureShiftModel> futureShifts = logic.GetAllFutureShifts();
                return Ok(futureShifts);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet]
        [Route("future_shifts/{id}")]
        public IActionResult GetOneFutureShift(int id)
        {
            try
            {
                FutureShiftModel futureShift = logic.GetSingleFutureShift(id);
                if (futureShift == null)
                    return NotFound($"id {id} not found");
                return Ok(futureShift);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPost]
        [Route("future_shifts")]
        public IActionResult AddFutureShift(FutureShiftModel futureShiftModel)
        {
            try
            {
                FutureShiftModel addedFutureShift = logic.AddFutureShiftModel(futureShiftModel);
                return Created("api/shifts/future_shifts/" + addedFutureShift.ShiftId, addedFutureShift);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPut]
        [Route("future_shifts/{id}")]
        public IActionResult UpdateFullFutureShift(int id, FutureShiftModel futureShiftModel)
        {
            try
            {
                futureShiftModel.ShiftId = id;
                FutureShiftModel updatedFutureShift = logic.UptdateFullFutureShift(futureShiftModel);
                if (updatedFutureShift == null)
                    return NotFound($"id {id} not found");
                return Ok(updatedFutureShift);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPatch]
        [Route("future_shifts/{id}")]
        public IActionResult UpdatePartialFutureShift(int id, FutureShiftModel futureShiftModel)
        {
            try
            {
                futureShiftModel.ShiftId = id;
                FutureShiftModel updatedFutureShift = logic.UptdatePartialFutureShift(futureShiftModel);
                if (updatedFutureShift == null)
                    return NotFound($"id {id} not found");
                return Ok(updatedFutureShift);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpDelete]
        [Route("future_shifts/{id}")]
        public IActionResult DeleteFutureShift(int id)
        {
            try
            {
                logic.DeleteFutureShift(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }





        [HttpGet]
        [Route("shift_types")]
        public IActionResult GetAllShiftTypes()
        {
            try
            {
                List<ShiftTypeModel> shiftTypes = logic.GetAllShiftTypes();
                return Ok(shiftTypes);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet]
        [Route("shift_types/{id}")]
        public IActionResult GetOneShiftType(int id)
        {
            try
            {
                ShiftTypeModel shiftType = logic.GetSingleShiftType(id);
                if (shiftType == null)
                    return NotFound($"id {id} not found");
                return Ok(shiftType);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPost]
        [Route("shift_types")]
        public IActionResult AddShiftType(ShiftTypeModel shiftTypeModel)
        {
            try
            {
                ShiftTypeModel addedShiftType = logic.AddShiftTypeModel(shiftTypeModel);
                return Created("api/shifts/shift_types/" + addedShiftType.ShiftTypeId, addedShiftType);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPut]
        [Route("shift_types/{id}")]
        public IActionResult UpdateFullShiftType(int id, ShiftTypeModel shiftTypeModel)
        {
            try
            {
                shiftTypeModel.ShiftTypeId = id;
                ShiftTypeModel updatedShiftType = logic.UptdateFullShiftType(shiftTypeModel);
                if (updatedShiftType == null)
                    return NotFound($"id {id} not found");
                return Ok(updatedShiftType);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPatch]
        [Route("shift_types/{id}")]
        public IActionResult UpdatePartialShiftType(int id, ShiftTypeModel shiftTypeModel)
        {
            try
            {
                shiftTypeModel.ShiftTypeId = id;
                ShiftTypeModel updatedShiftType = logic.UptdatePartialShiftType(shiftTypeModel);
                if (updatedShiftType == null)
                    return NotFound($"id {id} not found");
                return Ok(updatedShiftType);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpDelete]
        [Route("shift_types/{id}")]
        public IActionResult DeleteShiftType(int id)
        {
            try
            {
                logic.DeleteShiftType(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        public void Dispose()
        {
            logic.Dispose();
        }















        
    }
}
