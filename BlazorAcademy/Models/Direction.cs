using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BlazorAcademy.Models
{
	public class Direction
	{
		[Key]
		public byte direction_id { get; set; }
	}
}
