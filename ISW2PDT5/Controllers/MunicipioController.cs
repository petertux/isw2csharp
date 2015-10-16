using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ISW2PDT5.Controllers
{
    public class MunicipioController : Controller
    {
        private mydbEntities db = new mydbEntities();

        //
        // GET: /Municipio/

        public ActionResult Index()
        {
            var municipios = db.municipios.Include(m => m.departamento);
            return View(municipios.ToList());
        }

        //
        // GET: /Municipio/Details/5

        public ActionResult Details(int id = 0)
        {
            municipio municipio = db.municipios.Find(id);
            if (municipio == null)
            {
                return HttpNotFound();
            }
            return View(municipio);
        }

        //
        // GET: /Municipio/Create

        public ActionResult Create()
        {
            ViewBag.DEPARTAMENTO_id_departamento = new SelectList(db.departamentoes, "id_departamento", "dep_nombre");
            return View();
        }

        //
        // POST: /Municipio/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(municipio municipio)
        {
            if (ModelState.IsValid)
            {
                db.municipios.Add(municipio);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DEPARTAMENTO_id_departamento = new SelectList(db.departamentoes, "id_departamento", "dep_nombre", municipio.DEPARTAMENTO_id_departamento);
            return View(municipio);
        }

        //
        // GET: /Municipio/Edit/5

        public ActionResult Edit(int id = 0)
        {
            municipio municipio = db.municipios.Find(id);
            if (municipio == null)
            {
                return HttpNotFound();
            }
            ViewBag.DEPARTAMENTO_id_departamento = new SelectList(db.departamentoes, "id_departamento", "dep_nombre", municipio.DEPARTAMENTO_id_departamento);
            return View(municipio);
        }

        //
        // POST: /Municipio/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(municipio municipio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(municipio).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DEPARTAMENTO_id_departamento = new SelectList(db.departamentoes, "id_departamento", "dep_nombre", municipio.DEPARTAMENTO_id_departamento);
            return View(municipio);
        }

        //
        // GET: /Municipio/Delete/5

        public ActionResult Delete(int id = 0)
        {
            municipio municipio = db.municipios.Find(id);
            if (municipio == null)
            {
                return HttpNotFound();
            }
            return View(municipio);
        }

        //
        // POST: /Municipio/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            municipio municipio = db.municipios.Find(id);
            db.municipios.Remove(municipio);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}