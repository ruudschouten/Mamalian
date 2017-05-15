using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    public enum Gender {
        Male = 1,
        Female = 2
    }

    public enum Race {
        Cat = 1,
        Dog = 2,
        Fish = 3,
        Pidgeon = 4
    }

    public abstract class Character {
        public int Id { get; set; }
        public String Name { get; set; }
        public Gender Gender { get; set; }
        public Race Race { get; set; }
        public Stats Stats { get; set; }
    }
}
