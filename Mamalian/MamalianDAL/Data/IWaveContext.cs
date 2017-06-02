using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianLib;

namespace MamalianDAL.Data {
    public interface IWaveContext : IContext<Wave> {
        List<Enemy> GetAllEnemies(int id);
        List<PowerUp> GetAllPowerUps(int id);
    }
}
