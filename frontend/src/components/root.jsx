import { Outlet, NavLink } from "react-router-dom"

export default function RootLayout() {

    const [open, setOpen] = useState(true);
    const Menus = [
        { title: "Maze Map", src: Chart_fill },
        { title: "History", src: Calendar },
        { title: "Login", src: User, gap: true },
        { title: "Search", src: Search },
        { title: "Grid Monitoring", src: Chart }
    ];



    return (

        <div className="flex">
            <div
                className={` ${open ? "w-72" : "w-20 "
                    } bg-dark-purple h-screen p-5  pt-8 relative duration-300`}
            >
                <img
                    src={control} alt=""
                    className={`absolute cursor-pointer -right-3 top-9 w-7 border-dark-purple
           border-2 rounded-full  ${!open && "rotate-180"}`}
                    onClick={() => setOpen(!open)}
                />
                <div className="flex gap-x-4 items-center">
                    <img
                        src={logo} alt=""
                        className={`cursor-pointer duration-500 ${open && "rotate-[360deg]"
                            }`}
                    />
                    <h1
                        className={`text-white origin-left font-mono text-xl duration-200 ${!open && "scale-0"
                            }`}
                    >
                        BalanceBug
                    </h1>
                </div>
                <ul className="pt-6">
                    {Menus.map((Menu, index) => (
                        <NavLink to={"/" + str.toLowerCase().replace(/\s/g, "")}>Home
                            <li
                                key={index}
                                className={`flex  rounded-md p-2 cursor-pointer hover:bg-light-white text-gray-300 text-sm items-center gap-x-4 
                ${Menu.gap ? "mt-9" : "mt-2"} ${index === 0 && "bg-light-white"
                                    } `}
                            >
                                <img src={Menu.src} alt="" />
                                <span className={`${!open && "hidden"} font-mono origin-left hover:border-sky-400 duration-200`}>
                                    {Menu.title}
                                </span>
                            </li>
                        </NavLink>
                    ))}
                </ul>
            </div>

                                    

            <main>
                <Outlet />
            </main>

        </div>

    )
}