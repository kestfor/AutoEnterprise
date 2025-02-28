package person

type Technician struct {
	Person
}

type Welder struct {
	Person
}

type Assembler struct {
	Person
}

type Plumber struct {
	Person
}

func NewTechnician() *Technician {
	return &Technician{Person: Person{role: TechnicianRole}}
}

func NewWelder() *Welder {
	return &Welder{Person: Person{role: WelderRole}}
}

func NewAssembler() *Assembler {
	return &Assembler{Person: Person{role: AssemblerRole}}
}

func NewPlumber() *Plumber {
	return &Plumber{Person: Person{role: PlumberRole}}
}
