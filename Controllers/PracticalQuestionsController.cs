﻿using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using LSSCBackEnd.Models;
using Microsoft.EntityFrameworkCore;

namespace LSSCBackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PracticalQuestionsController : ControllerBase
    {
        lsscPortalContext dataOut = new lsscPortalContext();
        // GET: api/PracticalQuestions
        [HttpGet("{id}")]
        public IEnumerable<practicalQuestions> Get(int id)
        {
            List<practicalQuestions> practicalQuestion;
            practicalQuestion = dataOut.PracticalQuestions.FromSql("exec spQuestionPaperPractical " +id).ToList();
            return practicalQuestion;
        }

    }
}
