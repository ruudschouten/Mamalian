using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class WaveRepository :IWaveContext {
        private IWaveContext context;

        public WaveRepository(IWaveContext context) {
            this.context = context;
        }
        public List<Wave> GetAll() {
            return context.GetAll();
        }

        public Wave GetById(int id) {
            return context.GetById(id);
        }

        public Wave Insert(Wave obj) {
            return context.Insert(obj);
        }

        public bool Update(Wave obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }

        public List<Enemy> GetAllEnemies(int id) {
            return context.GetAllEnemies(id);
        }

        public List<PowerUp> GetAllPowerUps(int id) {
            return context.GetAllPowerUps(id);
        }
    }
}
